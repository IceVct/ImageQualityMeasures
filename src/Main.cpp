// Main for the pupil center algorithm

#include "Main.hpp"

int main(int argsc, char *argsv[]){

	double rmin = 0.0, rmax = 0.0;											// rmin and rmax are the minimum and maximum values of the iris radius 
	Mat inputImage;
	Mat grayScaleImage;
	int platformSucc = 0;
	double scale = 0.0;

	if(argsc < 3){
		cout << "At least two arguments must be passed! ./executable input_mage_file scale" << endl;
		exit(1);
	}

	scale = strtod(argsv[2], NULL);
	// reading the input image
	inputImage = imread(argsv[1], CV_LOAD_IMAGE_UNCHANGED);

	// converting the input image to grayscale
	cvtColor(inputImage, grayScaleImage, CV_BGR2GRAY);

	// the parameters for searching for the 
	rmin = 30.00;						
	rmax = 90.00;	

	/*****CHECKING QUALITY **/

	/*****SEGMENTATION*****/
	thresh(grayScaleImage, rmin, rmax, scale);

	printf("Iris parametes: (%d, %d) %d\n", iris.centerX, iris.centerY, iris.radius);
	printf("Pupil parametes: (%d, %d) %d\n", pupil.centerX, pupil.centerY, pupil.radius);

	circle(inputImage, Point(iris.centerX, iris.centerY), iris.radius, Scalar(0, 0, 255), 2, 8);
	circle(inputImage, Point(pupil.centerX, pupil.centerY), pupil.radius, Scalar(0, 255, 0), 2, 8);

	imshow("final output", inputImage);
	waitKey(0);
	
	/*****NORMALIZATION****/

	/*****RECOGNITION******/
		
	return 0;
}
