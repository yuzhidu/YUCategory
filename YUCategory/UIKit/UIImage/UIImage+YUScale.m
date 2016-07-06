//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  改变图片尺寸大小
//

#import "UIImage+YUScale.h"

@implementation UIImage (YUScale)
/**
 *  压缩为正方形图片，指定图片宽高尺寸
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image size:(CGFloat)newSize {
    
    // 使用图形上下文处理
    UIGraphicsBeginImageContext(CGSizeMake(newSize, newSize));
    
    [image drawInRect:CGRectMake(0,0,newSize,newSize)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  压缩图片，指定图片的形变值
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
@end
