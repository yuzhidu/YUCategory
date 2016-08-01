//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  压缩图片
//
//  图片的压缩其实是俩概念:
//  1、是 “压” 文件体积变小，但是像素数不变，长宽尺寸不变，那么质量可能下降，
//  2、是 “缩” 文件的尺寸变小，也就是像素数减少。长宽尺寸变小，文件体积同样会减小。
//  这个 UIImageJPEGRepresentation(image, 0.0)，是1的功能。
//  这个 [UIImage drawInRect:CGRectMake(0, 0, width, height)] 是2的功能。
//

// IEC标准
// 1GB 吉字节 = 1024 MB 兆字节
// 1MB 兆字节 = 1024 KB 千字节
// 1KB 千字节 = 1024 Byte 字节

// SI标准
// 1GB 吉字节 = 1000 MB 兆字节
// 1MB 兆字节 = 1000 KB 千字节
// 1KB 千字节 = 1000 Byte 字节

// 1 Byte 字节 = 8 bit 位

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImage (YUCompress)

/****************************************修复图片方向************************************/
#pragma mark - 修复图片方向
// 拍摄之后的图片会在拍摄水平的基础上自动发生90°旋转

/**
 *  修复图片旋转
 */
+ (UIImage *)yu_fixOrientation:(UIImage *)image;

/****************************************改变图片尺寸************************************/
#pragma mark - 改变图片尺寸
/**
 *  1.改变图片尺寸，正方形图片，指定图片宽高尺寸
 */
+ (UIImage *)yu_scaleImage:(UIImage *)sourceImage withSize:(CGFloat)newSize;

/**
 *  2.改变图片尺寸，指定图片宽，高度根据宽度自动计算
 */
+ (UIImage *)yu_scaleImage:(UIImage *)sourceImage withWidth:(CGFloat)newWidth;

/**
 *  3.改变图片尺寸，指定图片高，宽度根据高度自动计算
 */
+ (UIImage *)yu_scaleImage:(UIImage *)sourceImage withHeight:(CGFloat)newHeight;

// Tips：如果改变的是正方形图片，上边方法1，2，3其实是等效的

/**
 *  4.压缩图片，指定图片的形变值
 *
 *  @param scale 形变值(百分比)
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image scale:(CGFloat)scale;

/****************************************改变图片体积************************************/
#pragma mark - 改变图片体积
/**
 *  改变图片体积，使用PNG格式
 */
+ (NSData *)yu_compressByPNG:(UIImage *)sourceImage;

/**
 *  改变图片体积，使用JPEG格式
 */
+ (NSData *)yu_compressByJPEG:(UIImage *)sourceImage quality:(CGFloat)compressionQuality;

/**
 *  计算图片字节数 PNG格式
 */
+ (NSInteger)yu_computeBytesByPNG:(UIImage *)sourceImage;

/**
 *  计算图片字节数 JPEG格式
 */
+ (NSInteger)yu_computeBytesByJPEG:(UIImage *)sourceImage;
@end
