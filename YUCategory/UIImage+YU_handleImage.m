//
//  UIImage+YU_handleImage.m
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//  使用环境:ARC
//  Version:1.1

#import "UIImage+YU_handleImage.h"

@implementation UIImage (YU_handleImage)
//<<<<<<<<<<<<<<< 1.图片拉伸平铺 >>>>>>>>>>>>>>>
/**
 *  无角度值,图片平铺
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName
{
    UIImage *normal = [UIImage imageNamed:imageName];
    return [normal resizableImageWithCapInsets:UIEdgeInsetsZero];
}

/**
 *  四个角角度值相等
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName capInsets:(CGFloat)capInsets
{
    return [self yu_resizableImageWith:imageName top:capInsets left:capInsets bottom:capInsets right:capInsets];
}

/**
 *  自定义四个角度值
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName top:(CGFloat)topCapInsets left:(CGFloat)leftCapInsets bottom:(CGFloat)bottomCapInsets right:(CGFloat)rightCapInsets
{
    return [self yu_resizableImageWith:imageName top:topCapInsets left:leftCapInsets bottom:bottomCapInsets right:rightCapInsets resizingMode:UIImageResizingModeTile];
}

/**
 *  自定义四个角度值 和 图片模式
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName top:(CGFloat)topCapInsets left:(CGFloat)leftCapInsets bottom:(CGFloat)bottomCapInsets right:(CGFloat)rightCapInsets resizingMode:(UIImageResizingMode)resizingMode
{
    UIImage *normal = [UIImage imageNamed:imageName];
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(topCapInsets, leftCapInsets, bottomCapInsets, rightCapInsets) resizingMode:resizingMode];
}

//*******************************我是快乐的分割线*************************************/

//<<<<<<<<<<<<<<< 2.图片压缩 >>>>>>>>>>>>>>>
/**
 *  压缩为正方形图片，指定图片宽高尺寸
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image size:(CGFloat)newSize
{
    UIGraphicsBeginImageContext(CGSizeMake(newSize, newSize));
    
    [image drawInRect:CGRectMake(0,0,newSize,newSize)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  压缩图片，指定图片的形变值(百分比)
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image scale:(CGFloat)scale
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scale, image.size.height*scale));
    
    [image drawInRect:CGRectMake(0,0,image.size.width*scale, image.size.height*scale)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
