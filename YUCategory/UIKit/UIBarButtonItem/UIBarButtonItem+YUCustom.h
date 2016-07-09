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

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YUCustom)

/**
 *  1.只有图片
 */
+ (UIBarButtonItem *)yu_barButtonWithImage:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action;

/**
 *  2.只有文字
 */
+ (UIBarButtonItem *)yu_barButtonWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action;

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
