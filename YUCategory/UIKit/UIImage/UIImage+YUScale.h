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

#import <UIKit/UIKit.h>

@interface UIImage (YUScale)
/**
 *  压缩为正方形图片，指定图片宽高尺寸
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image size:(CGFloat)newSize;

/**
 *  压缩图片，指定图片的形变值
 *
 *  @param scale 形变值(百分比)
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image scale:(CGFloat)scale;
@end
