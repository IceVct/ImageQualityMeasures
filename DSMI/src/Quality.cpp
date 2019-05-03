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

Mat stdfilt(Mat src, Mat neighborhood){
      // define the output matrix
    Mat out, maxs;
    Mat c1, c2;
    Point anchor;
    Mat srcPow2;
    // normalizing the neighborhood matrix
    neighborhood.convertTo(neighborhood, CV_32F);
    double delta = 0; 		
    anchor = Point( -1, -1 );	
    out = src.clone();
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
    sqrt(maxs, out);
    
    return out;
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
    // Mat tempNeighboorsVariance(rows - 2, cols - 2, CV_32F, 0.0);
    Mat tempNeighboorsVariance;

    // Defining the ROI (removing the borders)
    Rect removeBordersROI(1, 1, cols - 2, rows - 2);

	Mat morphElement = (Mat_<int> (3, 3) << 0, 1, 0, 1, 0, 1, 0, 1, 0);
    morphElement.convertTo(morphElement, CV_8U);

    // Computing neighboors variance
    tempNeighboorsVariance = stdfilt(inputImage, morphElement);
    pow(tempNeighboorsVariance, 2.0, tempNeighboorsVariance);

    // Find max intensity difference from center to brighter and darker images.
	dilate(inputImage, maximas, morphElement);
    erode(inputImage, minimas, morphElement);

    // Find the max difference regardless whether brighter or darker
    absdiff(maximas, inputImage, brighter);
    absdiff(inputImage, minimas, darker);

    max(brighter, darker, maxDiffs);
	
	for (int i = 1; i < rows - 1; i++)
		for (int j = 1; j < cols - 1; j++){
            if (abs(inputImage.at<float>(i, j) - maximas.at<float>(i, j)) < 0.000001){
                tempS1.at<int>(i - 1, j - 1) = 1;
                tmpLocalMaxima.x = i;
                tmpLocalMaxima.y = j;
                tempLocalMaximas.push_back(tmpLocalMaxima);
            }
		}
    
    // return values
    *s1SignStatistics = tempS1;
    *maxDifferences = maxDiffs(removeBordersROI);
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
        neighboors[0] = abs(inputImage.at<float>(row, col) - inputImage.at<float>(row - 1, col)); // top neighboor
        neighboors[1] = abs(inputImage.at<float>(row, col) - inputImage.at<float>(row + 1, col)); // down neighboor
        neighboors[2] = abs(inputImage.at<float>(row, col) - inputImage.at<float>(row, col + 1)); // right neighboor
        neighboors[3] = abs(inputImage.at<float>(row, col) - inputImage.at<float>(row, col - 1)); // left neighboor

        // computing the neighborhood average
        meanStdDev(neighboors, neighboorsAverage, neighboorsVariance);
        mean = neighboorsAverage.val[0];

        t += mean/amountMaximas;
    }

    *threshold = t;
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

    calcHist(&inputImage, 1, 0, Mat(), histogram, 1, &nHistBins, &histRange, uniform, accumulate);

    // computing the percentage of occurrences of pixel values in the range [192, 255] (last bin) and from [0, 31] (first bin)
    float percetageHighIntensityPixels = 0.0, percentageLowIntensityPixels = 0.0, finalPercentage = 0.0;
    percetageHighIntensityPixels = histogram.at<float>(nHistBins - 1)/(float) nPixels;
    percentageLowIntensityPixels = histogram.at<float>(0)/nPixels;
    finalPercentage = percentageLowIntensityPixels + percetageHighIntensityPixels;

    // VERIFICAR DEPOIS A PORCENTAGEM DE PIXELS COM INTENSIDADE BAIXA, APARENTEMENTE IMAGENS MUITO ESCURAS TAMBEM ESTAO SAINDO COM NOTA MUITO BOA

    // if the percentage is lesser than the threshold, then the multiplier will be 1, else, it will be 1 - percentage
    highIntensityMultiplier = finalPercentage >= coeficientThreshold ? 1 - finalPercentage : 1.0;

    // computing the average value of all pixels from the normalized image
    // normalizedImageAverage = mean(normalizedImage);
    // cout << normalizedImageAverage << endl;
    // imageAverage = normalizedImageAverage.val[0];
    // cout << imageAverage << endl;

    // if the imageAverage >= highIntensityThreshold, then the value will be normalized between the values [0.01, 0.99],
    // invert proportional to the mean value. Ex: if the mean value is 0.75, then the multiplier is 0.99, if the mean is 1, then the mult is 0.01
    // highIntensityMultiplier = imageAverage < highIntensityThreshold ? 1.0 : (1 - (0.98*((imageAverage - intensityPercentage)/(1 - intensityPercentage)) + 0.01));
    // cout << highIntensityMultiplier << endl;

    // computing all the local maximas and maximum differences from the normalized image
    findLocalMaximas(normalizedImage, &S1, &maxDifferences, &localMaximas, &neighboorsVariance);

    // computing the threshold for the magnitude
    computeThresholdT(normalizedImage, localMaximas, &T);

    // Comparing the max difference of each pixel to the threshold 
    threshold(maxDifferences, S2, T, 1, THRESH_BINARY_INV);
    S2.convertTo(S2, CV_32S);

    // Computing the statistics of the coincidence pattern of the sign S1 and magnitude S2
    S = S1 & S2;
    S.convertTo(S, CV_32F);

    // in order to avoid division by 0, adding to each element of the variance matrix the value 0.00025
    neighboorsVariance += 0.00025;

    tempQuality = S/neighboorsVariance;
    Scalar sums = sum(tempQuality);
    nPixels = (rows - 2)*(cols - 2);
    qualityMeasured = sum(tempQuality)[0]/(float)nPixels;
    
    // normalizing the quality measured from [0,infinite) to [0, 1)]
    return (1.0 - exp(-0.01*qualityMeasured))*highIntensityMultiplier; // 0.01 taken from the paper
}
