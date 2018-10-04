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

float computeNeighboorsAverage(vector<float> inputVector);
float computeNeighboorsVariance(vector<float> inputVector);
float computeThresholdT(Mat inputImage, bool considerAllNeighboors);
float dsmiQuality(Mat inputImage, bool considerAllNeighboors);


#endif /* QUALITY_HPP */