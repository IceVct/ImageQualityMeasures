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
float computeNeighboorsVariance(vector<float> inputVector){
    float variance = 0.0;
    float average = computeNeighboorsAverage(inputVector); // computing the vector average
    int vectorSize = inputVector.size();

    for(int i = 0; i < vectorSize; i++){
        variance += ((inputVector[i] - average)*(inputVector[i] - average))/vectorSize;
    }

    return variance;
}

// Function that computes the threshold T, according to the the Jenadeleh et al "Realtime Quality Assessment of Iris Biometrics under Visible Light", 
// 2018 CVPR paper rules
float computeThresholdT(Mat inputImage, bool considerAllNeighboors){
    float threshold = 0.0;
    float neighboorsAverage = 0.0;
    int rows = inputImage.rows, cols = inputImage.cols;
    int nPixels = rows*cols;
    double minDifference = 0.0, maxDifference = 0.0;
    vector<float> neighboors(4);
    if(considerAllNeighboors == true)
        neighboors.resize(8);

    // looping through the image and computing the average of the max differences of each pixel from the image
    for(int i = 0; i < rows; i++){
        for(int j = 0; j < cols; j++){
            // all pixels not in the borders
            if((i > 0 && i < rows - 1) && (j > 0 && j < cols - 1)){
                // now checking if its going to consider pixels 4 or 8 neighboors
                // inserting the neighboors in the neighboors vector
                if(considerAllNeighboors == false){
                    // computing the differences from the reference pixel from its neighboors
                    neighboors[0] = inputImage.at<float>(i, j) - inputImage.at<float>(i - 1, j); // top neighboor
                    neighboors[1] = inputImage.at<float>(i, j) - inputImage.at<float>(i + 1, j); // down neighboor
                    neighboors[2] = inputImage.at<float>(i, j) - inputImage.at<float>(i, j + 1); // right neighboor
                    neighboors[3] = inputImage.at<float>(i, j) - inputImage.at<float>(i, j - 1); // left neighboor

                    // computing the neighboors average
                    // neighboorsAverage = computeNeighboorsAverage(neighboors);

                    // // computing the maximum and minimum differences
                    minMaxLoc(neighboors, &minDifference, &maxDifference);

                    threshold += maxDifference/nPixels;

                }else{
                    // computing the differences from the reference pixel from its neighboors
                    neighboors[0] = inputImage.at<float>(i, j) - inputImage.at<float>(i - 1, j); // top neighboor
                    neighboors[1] = inputImage.at<float>(i, j) - inputImage.at<float>(i + 1, j); // down neighboor
                    neighboors[2] = inputImage.at<float>(i, j) - inputImage.at<float>(i, j + 1); // right neighboor
                    neighboors[3] = inputImage.at<float>(i, j) - inputImage.at<float>(i, j - 1); // left neighboor
                    neighboors[4] = inputImage.at<float>(i, j) - inputImage.at<float>(i - 1, j - 1); // top left neighboor
                    neighboors[5] = inputImage.at<float>(i, j) - inputImage.at<float>(i + 1, j - 1); // down left neighboor
                    neighboors[6] = inputImage.at<float>(i, j) - inputImage.at<float>(i - 1, j + 1); // top right neighboor
                    neighboors[7] = inputImage.at<float>(i, j) - inputImage.at<float>(i + 1, j + 1); // down right neighboor

                    // computing the neighboors average
                    // neighboorsAverage = computeNeighboorsAverage(neighboors);

                    // // computing the maximum and minimum differences
                    minMaxLoc(neighboors, &minDifference, &maxDifference);

                    threshold += maxDifference/nPixels;

                }
                minDifference = 0.0;
                neighboorsAverage = 0.0;
                maxDifference = 0.0;
            }
        }
    }

    return threshold;
}

// Function that computes the DSMI quality measure
// The methods follows the Jenadeleh et al "Realtime Quality Assessment of Iris Biometrics under Visible Light", 2018 CVPR paper
// Inputs: inputImage (input image), considerAllNeighboors (a flag for considering 4 or 8 neighboors, true 8 and false 4)
// Output: the dsmi quality measure
float dsmiQuality(Mat inputImage, bool considerAllNeighboors){
    float qualityMeasured = 0.0;
    Mat normalizedImage;
    int rows = inputImage.rows, cols = inputImage.cols;
    int nPixels = rows*cols;
    int S = 0; // S array from the paper
    int s1SignStatistics = 0, s2MagnitudeStatistics = 0; // S1 and S2 arrays from the paper, which represents the sign and magnitudes patterns
    double localMaxima = 0.0, localMinima = 0.0;
    double maxDifference = 0.0, minDifference = 0.0; 
    float neighboorVariance = 0.0;
    vector<float> neighboorsSign(4), neighboorsMagnitude(4);
    if(considerAllNeighboors == true){
        neighboorsSign.resize(8);
        neighboorsMagnitude.resize(8);
    }
    double threshold = 0.0;

    // computing the normalized image
    normalize(inputImage, normalizedImage, 0, 1, NORM_MINMAX, CV_32F);

    // computing the threshold for the magnitude
    threshold = computeThresholdT(normalizedImage, considerAllNeighboors);

    // looping through the image and computing the sign and magnitudes arrays
    for(int i = 0; i < rows; i++){
        for(int j = 0; j < cols; j++){
            // all pixels not in the borders
            if((i > 0 && i < rows - 1) && (j > 0 && j < cols - 1)){
                // now checking if its going to consider pixels 4 or 8 neighboors
                // inserting the neighboors in the neighboors vector
                if(considerAllNeighboors == false){
                    // Sign features
                    neighboorsSign[0] = normalizedImage.at<float>(i - 1, j); // top neighboor
                    neighboorsSign[1] = normalizedImage.at<float>(i + 1, j); // down neighboor
                    neighboorsSign[2] = normalizedImage.at<float>(i, j + 1); // right neighboor
                    neighboorsSign[3] = normalizedImage.at<float>(i, j - 1); // left neighboor

                    // computing the local maxima and local minima
                    minMaxLoc(neighboorsSign, &localMinima, &localMaxima);
                    // printf("TOP %f, DOWN %f RIGHT %f LEFT %f REFERENCE %f Maxima %f\n", neighboorsSign[0], neighboorsSign[1], neighboorsSign[2], neighboorsSign[3], normalizedImage.at<float>(i, j), localMaxima);

                    // setting the S1 value according to the local maxima
                    s1SignStatistics = normalizedImage.at<float>(i, j) > localMaxima ? 1 : 0;
                    
                    // Magnitude features
                    // computing the differences from the reference pixel from its neighboors
                    neighboorsMagnitude[0] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i - 1, j); // top neighboor
                    neighboorsMagnitude[1] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i + 1, j); // down neighboor
                    neighboorsMagnitude[2] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i, j + 1); // right neighboor
                    neighboorsMagnitude[3] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i, j - 1); // left neighboor

                    // computing the maximum and minimum differences
                    minMaxLoc(neighboorsMagnitude, &minDifference, &maxDifference);

                    // setting the S2 value according to the maximum difference and the threshold computed for the image
                    s2MagnitudeStatistics = threshold > maxDifference ? 1 : 0;

                }else{
                    // Sign features
                    neighboorsSign[0] = normalizedImage.at<float>(i - 1, j); // top neighboor
                    neighboorsSign[1] = normalizedImage.at<float>(i + 1, j); // down neighboor
                    neighboorsSign[2] = normalizedImage.at<float>(i, j + 1); // right neighboor
                    neighboorsSign[3] = normalizedImage.at<float>(i, j - 1); // left neighboor
                    neighboorsSign[4] = normalizedImage.at<float>(i - 1, j - 1); // top left neighboor
                    neighboorsSign[5] = normalizedImage.at<float>(i + 1, j - 1); // down left neighboor
                    neighboorsSign[6] = normalizedImage.at<float>(i - 1, j + 1); // top right neighboor
                    neighboorsSign[7] = normalizedImage.at<float>(i + 1, j + 1); // down right neighboor

                    // computing the local maxima and local minima
                    minMaxLoc(neighboorsSign, &localMinima, &localMaxima);

                    // setting the S1 value according to the local maxima
                    s1SignStatistics = normalizedImage.at<float>(i, j) > localMaxima ? 1 : 0;
                    
                    // Magnitude features
                    // computing the differences from the reference pixel from its neighboors
                    neighboorsMagnitude[0] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i - 1, j); // top neighboor
                    neighboorsMagnitude[1] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i + 1, j); // down neighboor
                    neighboorsMagnitude[2] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i, j + 1); // right neighboor
                    neighboorsMagnitude[3] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i, j - 1); // left neighboor
                    neighboorsMagnitude[4] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i - 1, j - 1); // top left neighboor
                    neighboorsMagnitude[5] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i + 1, j - 1); // down left neighboor
                    neighboorsMagnitude[6] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i - 1, j + 1); // top right neighboor
                    neighboorsMagnitude[7] = normalizedImage.at<float>(i, j) - normalizedImage.at<float>(i + 1, j + 1); // down right neighboor

                    // computing the maximum and minimum differences
                    minMaxLoc(neighboorsMagnitude, &minDifference, &maxDifference);

                    // setting the S2 value according to the maximum difference and the threshold computed for the image
                    s2MagnitudeStatistics = threshold > maxDifference ? 1 : 0;
                }

                // evaluating the overall statistics S value based on the S1 and S2 values
                S = s1SignStatistics && s2MagnitudeStatistics ? 1 : 0;
                // printf("S = %d, S1 = %d, S2 = %d\n", S, s1SignStatistics, s2MagnitudeStatistics);

                // computing the reference pixel neighboorhood variance
                neighboorVariance = computeNeighboorsVariance(neighboorsSign);

                // computing the quality measure
                qualityMeasured += (float)S/(neighboorVariance + 0.00025); // 0.00025 taken from the paper

                // reseting the variables used
                localMaxima = 0.0;
                localMinima = 0.0;
                maxDifference = 0.0;
                minDifference = 0.0;
                neighboorVariance = 0.0;
            }
        }
    }
    qualityMeasured /= nPixels;
    
    // normalizing the quality measured from [0,infinite) to [0, 1)]
    return 1 - exp(-0.01*qualityMeasured); // 0.01 taken from the paper
}