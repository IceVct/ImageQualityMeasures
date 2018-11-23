// Main for the pupil center algorithm

#include "Main.hpp"

int main(int argsc, char *argsv[]){

	Mat inputImage;
	Mat grayScaleImage;

	if(argsc < 2){
		cout << "At least two arguments must be passed! ./executable input_mage_file" << endl;
		exit(1);
	}

	// reading the input image
	inputImage = imread(argsv[1], CV_LOAD_IMAGE_UNCHANGED);

	// converting the input image to grayscale
	cvtColor(inputImage, grayScaleImage, CV_BGR2GRAY);

	/*****CHECKING QUALITY **/
	double q = dsmiQuality(grayScaleImage, 0.2);
	cout << q;
		
	return 0;
}
