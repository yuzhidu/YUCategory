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

#import "UIImage+YUCompress.h"

@implementation UIImage (YUCompress)
/****************************************修复图片方向************************************/
#pragma mark - 修复图片方向
// 拍摄之后的图片会在拍摄水平的基础上自动发生90°旋转

/**
 *  修复图片旋转
 */
+ (UIImage *)yu_fixOrientation:(UIImage *)image {
    
    // No-op if the orientation is already correct
    // 如果图片是向上的就不用旋转
    if (image.imageOrientation == UIImageOrientationUp)
        return image;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    // 我们需要计算正确的形变，保证图片向上
    // 需要2步：从左/右/下旋转，如果镜像翻转
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    // 至此，我们把CGImage画到新的上下文中，然后应用旋转
    // 在以上基础上计算
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    // 至此，我们就从画布中创建了一个新的 UIImage
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

/****************************************改变图片尺寸************************************/
#pragma mark - 改变图片尺寸
/**
 *  通用方法
 */
//+ (UIImage *)yu_draw:(UIImage *)image withWidth:(CGFloat)width height:(CGFloat)height {
//    
//    // 使用图形上下文处理
//    UIGraphicsBeginImageContext(CGSizeMake(width, height));
//    
//    [image drawInRect:CGRectMake(0, 0, width, height)];
//    
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return newImage;
//}

/**
 *  1.改变图片尺寸，正方形图片，指定图片宽高尺寸
 */
+ (UIImage *)yu_scaleImage:(UIImage *)sourceImage withSize:(CGFloat)newSize {
    
//    return [self yu_draw:sourceImage withWidth:newSize height:newSize];
    
    // 使用图形上下文处理
    UIGraphicsBeginImageContext(CGSizeMake(newSize, newSize));
    
    [sourceImage drawInRect:CGRectMake(0, 0, newSize, newSize)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  2.改变图片尺寸，指定图片宽，高度根据宽度自动计算
 */
+ (UIImage *)yu_scaleImage:(UIImage *)sourceImage withWidth:(CGFloat)newWidth {
    
    CGFloat newHeight = (newWidth * sourceImage.size.height) / sourceImage.size.width;
    
//    return [self yu_draw:sourceImage withWidth:newWidth height:newHeight];
    // 使用图形上下文处理
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  3.改变图片尺寸，指定图片高，宽度根据高度自动计算
 */
+ (UIImage *)yu_scaleImage:(UIImage *)sourceImage withHeight:(CGFloat)newHeight {
    
    CGFloat newWidth = (newHeight * sourceImage.size.width) / sourceImage.size.height;
    
//    return [self yu_draw:sourceImage withWidth:newWidth height:newHeight];
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  4.压缩图片，指定图片的形变值
 *
 *  @param scale 形变值(百分比)
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image scale:(CGFloat)scale {
    
    // 使用图形上下文处理
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scale, image.size.height*scale));
    
    [image drawInRect:CGRectMake(0,0,image.size.width*scale, image.size.height*scale)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

/****************************************改变图片体积************************************/
#pragma mark - 改变图片体积

/**
 *  改变图片体积，使用PNG格式
 */
+ (NSData *)yu_compressByPNG:(UIImage *)sourceImage {
    
    // return image as PNG.
    // May return nil if image has no CGImageRef or invalid bitmap format
    return UIImagePNGRepresentation(sourceImage);
}

/**
 *  改变图片体积，使用JPEG格式
 */
+ (NSData *)yu_compressByJPEG:(UIImage *)sourceImage quality:(CGFloat)compressionQuality {
    
    // return image as JPEG.
    // May return nil if image has no CGImageRef or invalid bitmap format.
    // compression is 0(most)..1(least)
    if (compressionQuality > 1 || compressionQuality < 0) {
        return nil;
    }
    else {
        return UIImageJPEGRepresentation(sourceImage, compressionQuality);
    }
}

/**
 *  计算图片字节数 PNG格式
 */
+ (NSInteger)yu_computeBytesByPNG:(UIImage *)sourceImage {
    
    NSData *data = UIImagePNGRepresentation(sourceImage);
    return [data length];
}
/**
 *  计算图片字节数 JPEG格式
 */
+ (NSInteger)yu_computeBytesByJPEG:(UIImage *)sourceImage {
    
    NSData *data = UIImageJPEGRepresentation(sourceImage, 1);
    return [data length];
}

@end
