//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  图片拉伸平铺
//  注意：默认图片的模式是 UIImageResizingModeTile（瓦片）
//

#import <UIKit/UIKit.h>

@interface UIImage (YUResize)

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
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName
                               top:(CGFloat)topCapInsets
                              left:(CGFloat)leftCapInsets
                            bottom:(CGFloat)bottomCapInsets
                             right:(CGFloat)rightCapInsets;

/**
 *  自定义四个角度值 和 图片模式
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName
                               top:(CGFloat)topCapInsets
                              left:(CGFloat)leftCapInsets
                            bottom:(CGFloat)bottomCapInsets
                             right:(CGFloat)rightCapInsets
                      resizingMode:(UIImageResizingMode)resizingMode;
@end
