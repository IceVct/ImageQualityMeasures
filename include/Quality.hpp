#pragma once
#ifndef QUALITY_HPP
#define QUALITY_HPP

#include <opencv2/opencv.hpp>
#include <iostream>
#include <math.h>
#include <vector>
#include <list>
#include <string.h>
#include <string>
#include <float.h>
#include <math.h> 
#include <ctime>


using namespace cv;
using namespace std;

typedef struct maximas{
    int x;
    int y;
}LocalMaxima;


float computeNeighboorsAverage(vector<float> inputVector);
float computeNeighboorsVariance(vector<float> inputVector, float neighboorsAverage);
void findLocalMaximas(Mat inputImage, Mat *s1SignStatistics, Mat *maxDifferences, vector<LocalMaxima> *localMaximas);
void computeThresholdT(Mat inputImage, Mat *neighborhoodVariance, vector<LocalMaxima> localMaximas, float *threshold);
double dsmiQuality(Mat inputImage, bool considerAllNeighboors);

#endif /* QUALITY_HPP */