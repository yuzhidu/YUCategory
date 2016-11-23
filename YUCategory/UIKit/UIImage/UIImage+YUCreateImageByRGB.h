//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YUCreateImageByRGB)

/**
 用颜色生成图片，默认1x1

 @param color 颜色
 @return 生成的图片
 */
+ (UIImage *)yu_createImageWithColor:(UIColor *)color;


/**
 用颜色生成图片

 @param color 颜色
 @param size 图片尺寸
 @return 生成的图片
 */
+ (UIImage *)yu_createImageWithColor:(UIColor *)color size:(CGSize)size;
@end
