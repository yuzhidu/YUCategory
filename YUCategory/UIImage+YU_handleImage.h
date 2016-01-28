//
//  UIImage+YU_handleImage.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//  使用环境:ARC
//  Version:1.1

#import <UIKit/UIKit.h>

@interface UIImage (YU_handleImage)
//<<<<<<<<<<<<<<< 1.图片拉伸平铺 >>>>>>>>>>>>>>>

// 注意：默认图片的模式是 UIImageResizingModeTile（瓦片）

/**
 *  无角度值,图片平铺
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName;

/**
 *  四个角角度值相等
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName capInsets:(CGFloat)capInsets;

/**
 *  自定义四个角度值
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName top:(CGFloat)topCapInsets left:(CGFloat)leftCapInsets bottom:(CGFloat)bottomCapInsets right:(CGFloat)rightCapInsets;

/**
 *  自定义四个角度值 和 图片模式
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName top:(CGFloat)topCapInsets left:(CGFloat)leftCapInsets bottom:(CGFloat)bottomCapInsets right:(CGFloat)rightCapInsets resizingMode:(UIImageResizingMode)resizingMode;

//*******************************我是快乐的分割线*************************************/

//<<<<<<<<<<<<<<< 2.图片压缩 >>>>>>>>>>>>>>>
/**
 *  压缩为正方形图片，指定图片宽高尺寸
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image size:(CGFloat)newSize;

/**
 *  压缩图片，指定图片的形变值(百分比)
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image scale:(CGFloat)scale;
@end
