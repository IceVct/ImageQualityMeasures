#include <Quality.hpp>

// Function that computes the reference pixel neighboors average value
float computeNeighboorsAverage(vector<float> inputVector){
    float average = 0.0;
    int vectorSize = inputVector.size();

    for(int i = 0; i < vectorSize; i++){
        average += inputVector[i]/vectorSize;
    }

    return average;
}


// Function that computes the reference pixel neighboors variance
float computeNeighboorsVariance(vector<float> inputVector, float neighboorsAverage){
    float variance = 0.0;
    int vectorSize = inputVector.size();

    for(int i = 0; i < vectorSize; i++){
        variance += ((inputVector[i] - neighboorsAverage)*(inputVector[i] - neighboorsAverage))/vectorSize;
    }

    return variance;
}

// Standard deviation filter based neighborhood variance calculation method
Mat computeNeighborhoodVariance(Mat src, Mat neighborhood){
      // define the output matrix
    Mat maxs;
    Mat c1, c2;
    Point anchor;
    Mat srcPow2;
    // normalizing the neighborhood matrix
    neighborhood.convertTo(neighborhood, CV_32F);
    double delta = 0; 		
    anchor = Point( -1, -1 );	
    double n = sum(neighborhood)[0];
    double n1 = n - 1.0;
    // filter2D gives the man image with specified neighborhood
    // extrapolation at border is mirror extrapolation same as in matlab
    
    pow(src, 2.0, srcPow2);
    filter2D(srcPow2, c1, -1, neighborhood, anchor, delta, BORDER_REFLECT);
    c1 = c1/n1;

    filter2D(src, c2, -1, neighborhood, anchor, delta, BORDER_REFLECT);
    pow(c2, 2.0, c2);
    c2 /= (n1*n);

    max(c1 - c2, 0.0, maxs);
    
    return maxs;
}

// Function that finds all the local maximas from the input image, using the dilate operation with a kernel
// Returns a vector with the location and the local maximas and a binary matrix, where 1 are the local maximas and 0 not
// The return max, will already exclude the borders
void findLocalMaximas(Mat inputImage, Mat *s1SignStatistics, Mat *maxDifferences, vector<LocalMaxima> *localMaximas, Mat *neighboorsVariance){
    Mat maximas, minimas, darker, brighter, maxDiffs;
    int rows = inputImage.rows, cols = inputImage.cols;
	Mat tempS1 = Mat(rows - 2, cols - 2, CV_32S, Scalar(0));
    LocalMaxima tmpLocalMaxima;
    vector<LocalMaxima> tempLocalMaximas;
    Mat tempMaxDiffs = Mat(rows - 2, cols - 2, CV_32F, 0.0);
    // Mat tempNeighboorsVariance(rows - 2, cols - 2, CV_32F, 0.0);
    Mat tempNeighboorsVariance;

    // Defining the ROI (removing the borders)
    Rect removeBordersROI(1, 1, cols - 2, rows - 2);

	Mat morphElement = (Mat_<int> (3, 3) << 0, 1, 0, 1, 0, 1, 0, 1, 0);
    morphElement.convertTo(morphElement, CV_8U);

    // Computing neighboors variance
    tempNeighboorsVariance = computeNeighborhoodVariance(inputImage, morphElement);

    // Find max intensity difference from center to brighter and darker images.
	dilate(inputImage, maximas, morphElement);
    erode(inputImage, minimas, morphElement);

    // Find the max difference regardless whether brighter or darker
    absdiff(maximas, inputImage, brighter);
    absdiff(inputImage, minimas, darker);

    max(brighter, darker, maxDiffs);
	
	for (int i = 1; i < rows - 1; i++)
		for (int j = 1; j < cols - 1; j++){
            if (inputImage.at<float>(i, j) > maximas.at<float>(i, j)){
                tempS1.at<int>(i - 1, j - 1) = 1;
                tmpLocalMaxima.x = i;
                tmpLocalMaxima.y = j;
                tempLocalMaximas.push_back(tmpLocalMaxima);
            }
		}
    
    // return values
    *s1SignStatistics = tempS1;
    *maxDifferences = maxDiffs(removeBordersROI);
    // *maxDifferences = tempMaxDiffs;
    *localMaximas = tempLocalMaximas;
    *neighboorsVariance = tempNeighboorsVariance(removeBordersROI);
}

// Function that computes the threshold T, according to the the Jenadeleh et al "Realtime Quality Assessment of Iris Biometrics under Visible Light", 
// 2018 CVPR paper rules
void computeThresholdT(Mat inputImage, vector<LocalMaxima> localMaximas, float *threshold){
    Scalar neighboorsAverage, neighboorsVariance;
    float mean = 0.0;
    float t = 0.0;
    int rows = inputImage.rows, cols = inputImage.cols;
    vector<float> neighboors(4);
    int row = 0, col = 0;
    int amountMaximas = localMaximas.size();

    for(int i = 0; i < amountMaximas; i++){
        row = localMaximas[i].x;
        col = localMaximas[i].y;

        // storing the neighboors
        t += abs(inputImage.at<float>(row, col) - inputImage.at<float>(row - 1, col)) + // top neighboor
            abs(inputImage.at<float>(row, col) - inputImage.at<float>(row + 1, col)) + // down neighboor
            abs(inputImage.at<float>(row, col) - inputImage.at<float>(row, col + 1)) + // right neighboor
            abs(inputImage.at<float>(row, col) - inputImage.at<float>(row, col - 1)); // left neighboor
    }

    *threshold = t/amountMaximas;
}

// Function that computes the DSMI quality measure
// The methods follows the Jenadeleh et al "Realtime Quality Assessment of Iris Biometrics under Visible Light", 2018 CVPR paper
// Inputs: inputImage (input image), considerAllNeighboors (a flag for considering 4 or 8 neighboors, true 8 and false 4)
// Output: the dsmi quality measure
double dsmiQuality(Mat inputImage, float coeficientThreshold){
    double qualityMeasured = 0.0;
    Mat normalizedImage;
    int nPixels = 0;
    int s1SignStatistics = 0, s2MagnitudeStatistics = 0; // S1 and S2 arrays from the paper, which represents the sign and magnitudes patterns
    Mat neighboorsVariance;
    Mat S1, S2, S; // S1, S2 and S array from the paper
    Mat maxDifferences;
    Mat tempQuality;
    vector<LocalMaxima> localMaximas;
    float T = 0.0;
    int amountMaximas = 0;
    int minNormValue = 0, maxNormValue = 1; 
    /*  Both highIntensityThreshold and highIntensityMultiplier are used as an addition to the dsmi quality,
        in order to penalize the metric depending on the average of the pixel values. If the average suggests
        that the image has a percentage of pixel values greater than the threshold, it means that it is too bright.
        This feature was added to the dsmi because images that were too bright was gaining a high quality value.
    */
    float highIntensityMultiplier = 0.0; // it is used as a multiplier to the dsmi quality
    Scalar normalizedImageAverage;
    float imageAverage = 0.0;

    // computing the normalized image
    normalize(inputImage, normalizedImage, minNormValue, maxNormValue, NORM_MINMAX, CV_32F);

    int rows = inputImage.rows, cols = inputImage.cols;
    nPixels = rows*cols;

    // histogram calculation
    int nHistBins = 8; // computes the histogram in 8 bins
    float range[] = {0, 256};
    const float* histRange = {range};
    bool uniform = true, accumulate = false; // calcHist function parameters
    Mat histogram;

    // computing all the local maximas and maximum differences from the normalized image
    findLocalMaximas(normalizedImage, &S1, &maxDifferences, &localMaximas, &neighboorsVariance);

    // computing the threshold for the magnitude
    computeThresholdT(normalizedImage, localMaximas, &T);

    // Comparing the max difference of each pixel to the threshold 
    S2 = (T > maxDifferences)/255;
    S2.convertTo(S2, CV_32S);

    // Computing the statistics of the coincidence pattern of the sign S1 and magnitude S2
    S = S1 & S2;
    S.convertTo(S, CV_32F);

    // in order to avoid division by 0, adding to each element of the variance matrix the value 0.00025
    neighboorsVariance += 0.00025;

    tempQuality = S/neighboorsVariance;
    // Scalar sums = sum(tempQuality);
    nPixels = (rows - 2)*(cols - 2);
    qualityMeasured = sum(tempQuality)[0]/(float)nPixels;
    
    // normalizing the quality measured from [0,infinite) to [0, 1)]
    // return (1.0 - exp(-0.01*qualityMeasured))*highIntensityMultiplier; // 0.01 taken from the paper
    return (1.0 - exp(-0.01*qualityMeasured)); // 0.01 taken from the paper
}
