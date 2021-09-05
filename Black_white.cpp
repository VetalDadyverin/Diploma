#include "Black_white.h"


void black_white(string photo) {
	string name = "D:/Diploma/Diploma/Diploma/_result_.jpg";
	Mat image = imread(name);
	string erasing = "file";
	size_t pos = photo.find(erasing);
	if (pos != std::string::npos)
	{
		// If found then erase it from string
		photo.erase(pos, erasing.length());
	}

	erasing = ":///";
	pos = photo.find(erasing);
	if (pos != std::string::npos)
	{
		// If found then erase it from string
		photo.erase(pos, erasing.length());
	}

	//check if images exists
	if (image.empty()) {
		cout << "can not find image" << endl;
		return;
	}

	//create variable to store output image
	Mat output;

	//Make it more intensive
	image.convertTo(image, -1, 1, -100);

	//convert to gray scale
	Mat grayImage;
	cvtColor(image, grayImage, COLOR_BGR2GRAY);

	//invert the gray image
	Mat grayImageInv = 255 - grayImage;

	//apply gaussian blur
	GaussianBlur(grayImageInv, grayImageInv, Size(21, 21), 0);

	//blend using color dodge
	divide(grayImage, 255 - grayImageInv, output, 256.0);

	//Save new version of output
	imwrite(photo + "_bw.jpg", output);

	//press esc to exit the program
	waitKey(0);

	//close all the opened windows
	destroyAllWindows();
}

void drawBasicGrid(string photo) {

	string erasing = "file";
	size_t pos = photo.find(erasing);
	if (pos != std::string::npos)
	{
		// If found then erase it from string
		photo.erase(pos, erasing.length());
	}

	erasing = ":///";
	pos = photo.find(erasing);
	if (pos != std::string::npos)
	{
		// If found then erase it from string
		photo.erase(pos, erasing.length());
	}

	Mat image = imread(photo + "_bw.jpg");
	Mat img;

	cv::Size s = image.size();
	int cols = s.width;
	int rows = s.height;

	int x = cols / 8;
	int y = rows / 8;

	while (x < cols) {
		line(image, Point(x, 0), Point(x, rows), Scalar(0, 0, 0), 1);
		x += cols / 8;
	}
	while (y < rows) {
		line(image, Point(0, y), Point(cols, y), Scalar(0, 0, 0), 1);
		y += rows / 8;
	}

	imwrite(photo + "_grid.jpg", image);
	/*inamedWindow("OpenCV - DNN Face Detection", WINDOW_NORMAL);
	resizeWindow("OpenCV - DNN Face Detection", image.size());
	imshow("OpenCV - DNN Face Detection", image);*/
	int k = waitKey(0);

}