#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/dnn.hpp>

using namespace cv;
using namespace std;
using namespace cv::dnn;

const size_t inWidth = 300;
const size_t inHeight = 300;
const double inScaleFactor = 1.0;
const float confidenceThreshold = 0.7;
const cv::Scalar meanVal(104.0, 177.0, 123.0);

#define CAFFE

const std::string caffeConfigFile = "D:/Presenting_version/Files/deploy.prototxt";
const std::string caffeWeightFile = "D:/Presenting_version/Files/res10_300x300_ssd_iter_140000.caffemodel";

const std::string tensorflowConfigFile = "D:/Presenting_version/Files/opencv_face_detector.pbtxt";
const std::string tensorflowWeightFile = "D:/Presenting_version/Files/opencv_face_detector_uint8.pb";

void detectFaceOpenCVDNN(Net net, Mat& frameOpenCVDNN);
int dnn(string photo);