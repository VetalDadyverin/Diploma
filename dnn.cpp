#include"dnn.h"

void detectFaceOpenCVDNN(Net net, Mat& frameOpenCVDNN)
{
    int frameHeight = frameOpenCVDNN.rows;
    int frameWidth = frameOpenCVDNN.cols;

    //resize(frameOpenCVDNN, frameOpenCVDNN, Size(300, 300));

#ifdef CAFFE
    cv::Mat inputBlob = cv::dnn::blobFromImage(frameOpenCVDNN, inScaleFactor, cv::Size(inWidth, inHeight), meanVal, false, false);
#else
    cv::Mat inputBlob = cv::dnn::blobFromImage(frameOpenCVDNN, inScaleFactor, cv::Size(inWidth, inHeight), meanVal, true, false);
#endif

    net.setInput(inputBlob, "data");
    cv::Mat detection = net.forward("detection_out");

    cv::Mat detectionMat(detection.size[2], detection.size[3], CV_32F, detection.ptr<float>());

    for (int i = 0; i < detectionMat.rows; i++)
    {
        float confidence = detectionMat.at<float>(i, 2);
        cout << confidence << endl;

        if (confidence > confidenceThreshold)
        {

            int x1 = static_cast<int>(detectionMat.at<float>(i, 3) * frameWidth);
            int y1 = static_cast<int>(detectionMat.at<float>(i, 4) * frameHeight);
            int x2 = static_cast<int>(detectionMat.at<float>(i, 5) * frameWidth);
            int y2 = static_cast<int>(detectionMat.at<float>(i, 6) * frameHeight);

            cv::rectangle(frameOpenCVDNN, cv::Point(x1, y1), cv::Point(x2, y2), cv::Scalar(0, 255, 0), 2, 4);
        }
    }

}


int dnn(string photo)
{
#ifdef CAFFE
    Net net = cv::dnn::readNetFromCaffe(caffeConfigFile, caffeWeightFile);
#else
    Net net = cv::dnn::readNetFromTensorflow(tensorflowWeightFile, tensorflowConfigFile);
#endif

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
    cout << "AAAAAAAAAAAAAAAAAAAAA" << photo + ".jpg";
    Mat frame = imread(photo + ".jpg");
    cout << "Channels: " + to_string(frame.channels()) << endl;

    double tt_opencvDNN = 0;
    double fpsOpencvDNN = 0;
    detectFaceOpenCVDNN(net, frame);
    imwrite(photo + "_dnn.jpg", frame);
    imwrite(photo + "_det.jpg", frame);

    /*namedWindow("OpenCV - DNN Face Detection", WINDOW_NORMAL);
    resizeWindow("OpenCV - DNN Face Detection", frame.size());
    imshow("OpenCV - DNN Face Detection", frame);*/
    int k = waitKey(0);
    

    return 0;
}