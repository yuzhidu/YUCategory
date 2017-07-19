//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  自定义 BarButtonItem 样式
//
// 特别说明：margin 在4.0寸屏最小值是-16，
//                  4.7寸屏最小值也是-16，
//                  5.5寸屏最小值是-20
//         不管是 rightBarButtonItems 还是 leftBarButtonItems
//         控件都会贴着屏幕边缘，最大值没有限制，不过超出屏幕就无意义了
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YUCustom)
/**
 1.0 图片：调整间隙，有高亮图，自定义宽高
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action
                               highlightedImage:(NSString *)highlightedName
                                         margin:(CGFloat)margin
                                          width:(CGFloat)width;
/**
 *  1.1 图片
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action;
/**
 *  1.2 图片：有高亮图
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action
                               highlightedImage:(NSString *)highlightedName;
/**
 *  1.3 图片：调整间隙
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action
                                         margin:(CGFloat)margin;
/**
 *  1.4 图片：有高亮图，调整间隙
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action
                               highlightedImage:(NSString *)highlightedName
                                         margin:(CGFloat)margin;


/**
 *  2.0 文字：自定义颜色、字体、间隙、高亮文字、高亮颜色、字体排列方式、控件大小
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithTitle:(NSString *)title
                                         target:(id)target
                                         action:(SEL)action
                                          color:(UIColor *)color
                                           font:(UIFont *)font
                                         margin:(CGFloat)margin
                               highlightedTitle:(NSString *)highlightedTitle
                               highlightedColor:(UIColor *)highlightedColor
                                  textAlignment:(NSTextAlignment)textAlignment
                                          width:(CGFloat)width;
/**
 *  2.1 文字：自定义颜色、字体
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithTitle:(NSString *)title
                                         target:(id)target
                                         action:(SEL)action
                                          color:(UIColor *)color
                                           font:(UIFont *)font;
/**
 *  2.2 文字：自定义颜色、字体、间隙
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithTitle:(NSString *)title
                                         target:(id)target
                                         action:(SEL)action
                                          color:(UIColor *)color
                                           font:(UIFont *)font
                                         margin:(CGFloat)margin;
@end
