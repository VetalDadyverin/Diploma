#include"grabcut.h"

bool leftDown = false, leftup = false;
Mat img;
Mat img1;
Point cor1, cor2;
Rect box;

void mouse_call(int event, int x, int y, int, void*)
{
    if (event == EVENT_LBUTTONDOWN)
    {
        leftDown = true;
        cor1.x = x;
        cor1.y = y;
        cout << "Corner 1: " << cor1 << endl;

    }
    if (event == EVENT_LBUTTONUP)
    {
        if (abs(x - cor1.x) > 20 && abs(y - cor1.y) > 20) //checking whether the region is too small
        {
            leftup = true;
            cor2.x = x;
            cor2.y = y;
            cout << "Corner 2: " << cor2 << endl;
        }
        else
        {
            cout << "Select a region more than 20 pixels" << endl;
        }
    }

    if (leftDown == true && leftup == false) //when the left button is down
    {
        Point pt;
        pt.x = x;
        pt.y = y;
        Mat temp_img = img.clone();
        rectangle(temp_img, cor1, pt, Scalar(0, 0, 255)); //drawing a rectangle continuously
        imshow("Original", temp_img);
  

    }
    if (leftDown == true && leftup == true) //when the selection is done
    {

        box.width = abs(cor1.x - cor2.x);
        box.height = abs(cor1.y - cor2.y);
        box.x = min(cor1.x, cor2.x);
        box.y = min(cor1.y, cor2.y);
        Mat crop(img1, box);//Selecting a ROI(region of interest) from the original pic
        namedWindow("Cropped Image", WINDOW_NORMAL);
        resizeWindow("Cropped Image", crop.size());
        imshow("Cropped Image", crop); //showing the cropped image
        imwrite("D:/Diploma/Diploma/Diploma/_result_.jpg", crop);
        leftDown = false;
        leftup = false;

    }

}


int grab_and_cut(string photo)
{
    //img = imread(photo + ".jpg");
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
    cout << photo + "_det.jpg" << endl;
    img = imread(photo + "_det.jpg");
    img1 = imread(photo + ".jpg");

    namedWindow("Original", WINDOW_NORMAL);
    resizeWindow("Original", img.size());
    imshow("Original", img);

    setMouseCallback("Original", mouse_call); //setting the mouse callback for selecting the region with mouse

    while (char(waitKey(1) != 'q')) //waiting for the 'q' key to finish the execution
    return 0;
}