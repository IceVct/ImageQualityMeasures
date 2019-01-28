#pragma once
#ifndef FEATURE_CORRELATION_MEASURE
#define FEATURE_CORRELATION_MEASURE

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

// FeatureCorrelationMeasure Class declaration

class FeatureCorrelationMeasure {

    // class private attributes
    private:

    float dilationMeasure;
    float occlusionMeasure;
    float fcmMeasure;
    float finalComputedMeasure;

    // class public methods
    public:

    /*Constructors*/

    // default constructor
    FeatureCorrelationMeasure(){
        dilationMeasure = 0.0;
        occlusionMeasure = 0.0;
        fcmMeasure = 0.0;
        finalComputedMeasure = 0.0;
    }

    /*End of Constructors*/

    // getters and setters
    float getDilationMeasure();
    float getOcclusionMeasure();
    float getFeatureCorrelationMeasure();
    void setDilationMeasure();
    void setOcclusionMeasure();
    void setFeatureCorrelationMeasure();

    // auxiliar methods, in order to perform the FFT and Log Gabor Filter

    // methods that computes the measures
    


};

#endif /* FEATURE_CORRELATION_MEASURE */