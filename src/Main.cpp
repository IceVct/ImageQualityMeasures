// Main for the pupil center algorithm

#include "Main.hpp"

int main(int argsc, char *argsv[]){

	double rmin = 0.0, rmax = 0.0;											// rmin and rmax are the minimum and maximum values of the iris radius 
	Mat inputImage;
	Mat grayScaleImage;
	int platformSucc = 0;
	double scale = 0.0;

	if(argsc < 2){
		cout << "At least two arguments must be passed! ./executable input_mage_file" << endl;
		exit(1);
	}

	scale = strtod(argsv[2], NULL);
	// reading the input image
	inputImage = imread(argsv[1], CV_LOAD_IMAGE_UNCHANGED);

	// converting the input image to grayscale
	cvtColor(inputImage, grayScaleImage, CV_BGR2GRAY);

	/*****CHECKING QUALITY **/
	double q = dsmiQuality(grayScaleImage, 0.2);
	cout << q;
		
	return 0;
}
