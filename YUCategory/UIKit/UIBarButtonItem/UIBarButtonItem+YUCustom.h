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
 1.1 只有图片
 */
+ (NSArray<UIBarButtonItem *> *)yu_barButtonWithImage:(NSString *)imageName
                                               target:(id)target
                                               action:(SEL)action;
/**
 1.2 只有图片，调整间隙
 */
+ (NSArray<UIBarButtonItem *> *)yu_barButtonWithImage:(NSString *)imageName
                                               target:(id)target
                                               action:(SEL)action
                                               margin:(CGFloat)margin;
/**
 1.3 只有图片，调整间隙，有高亮图
 */
+ (NSArray<UIBarButtonItem *> *)yu_barButtonWithImage:(NSString *)imageName
                                     highlightedImage:(NSString *)highlightedImageName
                                               target:(id)target
                                               action:(SEL)action
                                               margin:(CGFloat)margin;
/**
 1.4 只有图片，调整间隙，有高亮图，自定义宽高
 
 @param imageName 图片名
 @param highlightedImageName 图片高亮名
 @param target 监听者
 @param action 执行函数
 @param margin 间隙（见：特别说明）
 @param size 控件大小
 @return 数组
 */
+ (NSArray<UIBarButtonItem *> *)yu_barButtonWithImage:(NSString *)imageName
                                     highlightedImage:(NSString *)highlightedImageName
                                               target:(id)target
                                               action:(SEL)action
                                               margin:(CGFloat)margin
                                                 size:(CGSize)size;


/**
 *  2.只有文字
 */
+ (UIBarButtonItem *)yu_barButtonWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action;
/**
 *  2.只有文字，自定义字体、颜色、宽高
 */
+ (UIBarButtonItem *)yu_barButtonWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action
                                      font:(UIFont *)font
                                     color:(UIColor *)color
                                      size:(CGSize)size;

/**
 *  3.图片在左，文字在右
 */
+ (UIBarButtonItem *)yu_barButtonWithImage:(NSString *)imageName
                                     title:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action;

/**
 *  4.文字在左，图片在右
 */
+ (UIBarButtonItem *)yu_barButtonWithTitle:(NSString *)title
                                     image:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action;

@end
