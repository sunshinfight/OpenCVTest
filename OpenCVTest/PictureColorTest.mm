//
//  PictureColorTest.m
//  OpenCVTest
//
//  Created by Lemon on 2022/4/26.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "PictureColorTest.hpp"
#import "UIImage+OpenCV.h"


using namespace cv;

@implementation PictureColorTest

- (void)calculateColorFromImage:(UIImage*)image {
    
    Mat srcImage = image.CVMat, dstImage, imagePart;
    
    // 区域
    cv::Rect rect;
    // 计算区域
    int x = 50;
    int y = 50;
    int width = 100;
    int height = 100;
    
    // 取样的步长
    int strip = 4;
    
    // 要检测的图
    imagePart = srcImage;
    
    int numberOfRow = imagePart.rows;
    int numberOfCol = imagePart.cols;
    
    int r = 0, g = 0, b = 0;
    
    int recodeLoop = 0;
    
    // 初始化区域
    rect = cv::Rect(x, y, width, height);
    
//    cvtColor(imagePart, dstImage, COLOR_BGR2HSV);
    
    int channels = imagePart.channels();
    
    if (4 == channels) {
        
        cv::Point pointVal;
        
        for(int row = 0; row < numberOfRow; row += strip) {
            
            for(int col = 0; col < numberOfCol; col += strip) {
                
                pointVal.x = col;
                pointVal.y = row;
                
                r += imagePart.at<Vec3b>(pointVal)[0];
                g += imagePart.at<Vec3b>(pointVal)[1];
                b += imagePart.at<Vec3b>(pointVal)[2];
                
                recodeLoop++;
            }
            
        }
        
    }
    
    NSLog(@"r: %d, g: %d, b: %d", r, g, b);
    
    int loopTimes = numberOfRow / strip * numberOfCol / strip;
    
    NSLog(@"record loop: %d, calLoop: %d", recodeLoop, loopTimes);
    
    int ar = r / loopTimes;
    
    int ag = g / loopTimes;
    
    int ab = b / loopTimes;
    
    
    NSLog(@"average rgb: %d %d %d", ar, ag, ab);

    
}


@end
