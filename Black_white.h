#pragma once

#include "opencv2/core/core.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>
using namespace cv;
using namespace std;


void black_white(string photo);
void drawBasicGrid(string photo);