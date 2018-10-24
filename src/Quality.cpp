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

// Functio that finds all the local maximas from the input image, using the dilate operation with a kernel
// Returns a vector with the location and the local maximas and a binary matrix, where 1 are the local maximas and 0 not
// The return max, will already exclude the borders
void findLocalMaximas(Mat inputImage, Mat *s1SignStatistics, Mat *maxDifferences, vector<LocalMaxima> *localMaximas){
    Mat maximas, minimas, darker, brighter, maxDiffs;
    int rows = inputImage.rows, cols = inputImage.cols;
	Mat tempS1 = Mat(rows - 2, cols - 2, CV_32S, Scalar(0));
	Mat tempMaxDiffs = Mat(rows - 2, cols - 2, CV_32F, 0.0);
    LocalMaxima tmpLocalMaxima;
    vector<LocalMaxima> tempLocalMaximas;

	Mat morphElement = getStructuringElement(MORPH_ELLIPSE, Size(3, 3));

    // Find max intensity difference from center to brighter and darker images.
	dilate(inputImage, maximas, morphElement);
    erode(inputImage, minimas, morphElement);

    // Find the max difference regardless whether brighter or darker
    absdiff(maximas, inputImage, brighter);
    absdiff(inputImage, minimas, darker);

    max(brighter, darker, maxDiffs);
	
	for (int i = 1; i < rows - 1; i++)
		for (int j = 1; j < cols - 1; j++){
            // storing the maximum differences
            tempMaxDiffs.at<float>(i - 1, j - 1) = maxDiffs.at<float>(i, j);

            if (abs(inputImage.at<float>(i, j) - maximas.at<float>(i, j)) < 0.000001){
                tempS1.at<int>(i - 1, j - 1) = (float) 1.0;
                tmpLocalMaxima.x = i;
                tmpLocalMaxima.y = j;
                tempLocalMaximas.push_back(tmpLocalMaxima);
            }	
		}
    
    // return values
    *s1SignStatistics = tempS1;
    *maxDifferences = tempMaxDiffs;
    *localMaximas = tempLocalMaximas;
}

// Function that computes the threshold T, according to the the Jenadeleh et al "Realtime Quality Assessment of Iris Biometrics under Visible Light", 
// 2018 CVPR paper rules
void computeThresholdT(Mat inputImage, Mat *neighborhoodVariance, vector<LocalMaxima> localMaximas, float *threshold){
    Scalar neighboorsAverage, neighboorsVariance;
    float mean = 0.0, variance = 0.0;
    float t = 0.0;
    int rows = inputImage.rows, cols = inputImage.cols;
    Mat tempNeighboorsVariance(rows - 2, cols - 2, CV_32F, 0.0);
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

        // computing the neighborhood average and variance
        meanStdDev(neighboors, neighboorsAverage, neighboorsVariance);
        mean = neighboorsAverage.val[0];
        variance = neighboorsVariance.val[0]*neighboorsVariance.val[0];
        tempNeighboorsVariance.at<float>(row - 1, col - 1) = variance;

        t += mean/amountMaximas;
    }

    *threshold = t;
    *neighborhoodVariance = tempNeighboorsVariance;
}

// Function that computes the DSMI quality measure
// The methods follows the Jenadeleh et al "Realtime Quality Assessment of Iris Biometrics under Visible Light", 2018 CVPR paper
// Inputs: inputImage (input image), considerAllNeighboors (a flag for considering 4 or 8 neighboors, true 8 and false 4)
// Output: the dsmi quality measure
double dsmiQuality(Mat inputImage, bool considerAllNeighboors){
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

    // computing the normalized image
    normalize(inputImage, normalizedImage, 0, 1, NORM_MINMAX, CV_32F);

    int rows = inputImage.rows, cols = inputImage.cols;
    nPixels = rows*cols;

    // computing all the local maximas and maximum differences from the normalized image
    findLocalMaximas(normalizedImage, &S1, &maxDifferences, &localMaximas);

    // computing the threshold for the magnitude
    computeThresholdT(normalizedImage, &neighboorsVariance, localMaximas, &T);

    // Comparing the max difference of each pixel to the threshold 
    threshold(maxDifferences, S2, T, 1, THRESH_BINARY_INV);
    S2.convertTo(S2, CV_32S);

    // Computing the statistics of the coincidence pattern of the sign S1 and magnitude S2
    S = S1 & S2;
    S.convertTo(S, CV_32F);

    // in order to avoid division by 0, adding to each element of the variance matrix the value 0.00025
    neighboorsVariance += 0.00025;

    tempQuality = S/neighboorsVariance;
    qualityMeasured = sum(tempQuality)[0]/nPixels;
    
    // normalizing the quality measured from [0,infinite) to [0, 1)]
    return 1 - exp(-0.01*qualityMeasured); // 0.01 taken from the paper
}