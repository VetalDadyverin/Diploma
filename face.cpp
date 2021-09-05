#include "face.h"


int face(string photo)
{
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
        Mat image = imread(photo + ".jpg");
        //capture >> image;
        if (image.empty())
            cout << " ERROR: No image" << endl;

        // Load Face cascade (.xml file)
        CascadeClassifier face_cascade;
        //face_cascade.load("C:/Users/Vitalii/Downloads/haarcascade_frontalface_alt.xml");
        if (!face_cascade.load("D:/Presenting_version/Files/haarcascade_frontalface_alt.xml"))
        {
            cerr << "Error Loading XML file" << endl;
            return 0;
        }

        // Detect faces
        std::vector<Rect> faces;
        face_cascade.detectMultiScale(image, faces, 1.1, 2, 0 | CASCADE_SCALE_IMAGE, Size(30, 30));

        // Draw circles on the detected faces
        for (int i = 0; i < faces.size(); i++)
        {
            Point center(faces[i].x + faces[i].width * 0.5, faces[i].y + faces[i].height * 0.5);
            ellipse(image, center, Size(faces[i].width * 0.5, faces[i].height * 0.5), 0, 0, 360, Scalar(255, 0, 255), 4, 8, 0);
        }
        imwrite(photo + "_haar.jpg", image); 
        imwrite(photo + "_det.jpg", image);
        /*namedWindow("image", WINDOW_NORMAL);
        resizeWindow("image", image.size());
        imshow("image", image);*/
        int k = waitKey(0);
    //}

    return 0;
}