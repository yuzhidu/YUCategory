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

#import "UIImage+YUResize.h"

@implementation UIImage (YUResize)

/**
 *  无角度值,图片平铺
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName {
    
    UIImage *normal = [UIImage imageNamed:imageName];
    return [normal resizableImageWithCapInsets:UIEdgeInsetsZero];
}

/**
 *  四个角角度值相等
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName capInsets:(CGFloat)capInsets {
    
    return [self yu_resizableImageWith:imageName
                                   top:capInsets
                                  left:capInsets
                                bottom:capInsets
                                 right:capInsets];
}

/**
 *  自定义四个角度值
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName
                               top:(CGFloat)topCapInsets
                              left:(CGFloat)leftCapInsets
                            bottom:(CGFloat)bottomCapInsets
                             right:(CGFloat)rightCapInsets {
    
    return [self yu_resizableImageWith:imageName
                                   top:topCapInsets
                                  left:leftCapInsets
                                bottom:bottomCapInsets
                                 right:rightCapInsets
                          resizingMode:UIImageResizingModeTile];
}

/**
 *  自定义四个角度值 和 图片模式
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName
                               top:(CGFloat)topCapInsets
                              left:(CGFloat)leftCapInsets
                            bottom:(CGFloat)bottomCapInsets
                             right:(CGFloat)rightCapInsets
                      resizingMode:(UIImageResizingMode)resizingMode {
    
    UIImage *normal = [UIImage imageNamed:imageName];
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(topCapInsets,
                                                                leftCapInsets,
                                                                bottomCapInsets,
                                                                rightCapInsets)
                                  resizingMode:resizingMode];
}
@end
