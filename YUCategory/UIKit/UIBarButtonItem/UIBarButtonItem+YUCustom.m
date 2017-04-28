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

#import "UIBarButtonItem+YUCustom.h"

#define kMaxHeight      44.f
#define kMinMargin      -16.f
#define kFontSize       15.f

@implementation UIBarButtonItem (YUCustom)
/**
 *  1.0 图片：有高亮图，调整间隙，自定义宽高
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action
                               highlightedImage:(NSString *)highlightedName
                                         margin:(CGFloat)margin
                                           size:(CGSize)size
{
    UIButton *btn = [[UIButton alloc] init];
    btn.imageView.contentMode = UIViewContentModeCenter;
    [btn setImage:[UIImage imageNamed:name]
         forState:UIControlStateNormal];
    if (highlightedName != nil) {
        [btn setImage:[UIImage imageNamed:highlightedName]
             forState:UIControlStateHighlighted];
    }
    [btn addTarget:target
            action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, size.width, size.height);
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                    target:nil
                                                                                    action:nil];
    negativeSpacer.width = margin;
    NSArray<UIBarButtonItem *> *arr = @[negativeSpacer, barButtonItem];
    return arr;
}
/**
 *  1.1 图片
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action
{
    return [UIBarButtonItem yu_barWithImage:name
                                     target:target
                                     action:action
                           highlightedImage:nil
                                     margin:kMinMargin
                                       size:CGSizeMake(kMaxHeight, kMaxHeight)];
}
/**
 *  1.2 图片：有高亮图
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action
                               highlightedImage:(NSString *)highlightedName
{
    return [UIBarButtonItem yu_barWithImage:name
                                     target:target
                                     action:action
                           highlightedImage:highlightedName
                                     margin:kMinMargin
                                       size:CGSizeMake(kMaxHeight, kMaxHeight)];
}
/**
 *  1.3 图片：调整间隙
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action
                                         margin:(CGFloat)margin
{
    return [UIBarButtonItem yu_barWithImage:name
                                     target:target
                                     action:action
                           highlightedImage:nil
                                     margin:margin
                                       size:CGSizeMake(kMaxHeight, kMaxHeight)];
}
/**
 *  1.4 图片：有高亮图，调整间隙
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithImage:(NSString *)name
                                         target:(id)target
                                         action:(SEL)action
                               highlightedImage:(NSString *)highlightedName
                                         margin:(CGFloat)margin
{
    return [UIBarButtonItem yu_barWithImage:name
                                     target:target
                                     action:action
                           highlightedImage:highlightedName
                                     margin:margin
                                       size:CGSizeMake(kMaxHeight, kMaxHeight)];
}


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
                                           size:(CGSize)size
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    if (highlightedTitle != nil) {
        [btn setTitle:highlightedTitle forState:UIControlStateHighlighted];
    }
    [btn setTitleColor:color forState:UIControlStateNormal];
    if (highlightedColor != nil) {
        [btn setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    }
    btn.titleLabel.textAlignment = textAlignment;
    [btn addTarget:target
            action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, size.width, size.height);
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                    target:nil
                                                                                    action:nil];
    negativeSpacer.width = margin;
    NSArray<UIBarButtonItem *> *arr = @[negativeSpacer, barButtonItem];
    return arr;
}
/**
 *  2.1 文字
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithTitle:(NSString *)title
                                         target:(id)target
                                         action:(SEL)action
{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:kFontSize]};
    CGSize maxSize = CGSizeMake(MAXFLOAT, kMaxHeight);
    CGSize controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil].size;
    return [UIBarButtonItem yu_barWithTitle:title
                                     target:target
                                     action:action
                                      color:[UIColor whiteColor]
                                       font:[UIFont systemFontOfSize:kFontSize]
                                     margin:kMinMargin
                           highlightedTitle:nil
                           highlightedColor:nil
                              textAlignment:NSTextAlignmentCenter
                                       size:CGSizeMake(controlSize.width+10, kFontSize)];
}
/**
 *  2.2 文字：自定义颜色、字体
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithTitle:(NSString *)title
                                         target:(id)target
                                         action:(SEL)action
                                          color:(UIColor *)color
                                           font:(UIFont *)font
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize maxSize = CGSizeMake(MAXFLOAT, kMaxHeight);
    CGSize controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil].size;
    return [UIBarButtonItem yu_barWithTitle:title
                                     target:target
                                     action:action
                                      color:color
                                       font:font
                                     margin:kMinMargin
                           highlightedTitle:nil
                           highlightedColor:nil
                              textAlignment:NSTextAlignmentCenter
                                       size:CGSizeMake(controlSize.width+10, kFontSize)];
}

/**
 *  2.3 文字：自定义颜色、字体、间隙、字体排列方式
 */
+ (NSArray<UIBarButtonItem *> *)yu_barWithTitle:(NSString *)title
                                         target:(id)target
                                         action:(SEL)action
                                          color:(UIColor *)color
                                           font:(UIFont *)font
                                         margin:(CGFloat)margin
                                  textAlignment:(NSTextAlignment)textAlignment
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize maxSize = CGSizeMake(MAXFLOAT, kMaxHeight);
    CGSize controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil].size;
    return [UIBarButtonItem yu_barWithTitle:title
                                     target:target
                                     action:action
                                      color:color
                                       font:font
                                     margin:margin
                           highlightedTitle:nil
                           highlightedColor:nil
                              textAlignment:NSTextAlignmentCenter
                                       size:CGSizeMake(controlSize.width+10, kFontSize)];
}

/**
 *  3.图片在左，文字在右
 */
+ (UIBarButtonItem *)yu_barButtonWithImage:(NSString *)imageName
                                     title:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action {
    
    UIControl *control = [[UIControl alloc] init];
    [control addTarget:target
                action:action
      forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    imageV.image = [UIImage imageNamed:imageName];
    imageV.frame = CGRectMake(0, 0, kMaxHeight, kMaxHeight);
    [control addSubview:imageV];
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:kFontSize];
    titleLab.textColor = [UIColor whiteColor];
    [control addSubview:titleLab];
    
    NSDictionary *attrs = @{NSFontAttributeName : titleLab.font};
    CGSize maxSize = CGSizeMake(120, kMaxHeight);
    CGRect controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil];
    titleLab.text = title;
    titleLab.frame = CGRectMake(kMaxHeight, 0, controlSize.size.width, kMaxHeight);
    
    control.frame = CGRectMake(0, 0, kMaxHeight+controlSize.size.width+1, kMaxHeight);
    
    return [[UIBarButtonItem alloc] initWithCustomView:control];
}

/**
 *  4.文字在左，图片在右
 */
+ (UIBarButtonItem *)yu_barButtonWithTitle:(NSString *)title
                                     image:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action {
    
    UIControl *control = [[UIControl alloc] init];
    [control addTarget:target
                action:action
      forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont systemFontOfSize:kFontSize];
    titleLab.textColor = [UIColor whiteColor];
    [control addSubview:titleLab];
    
    NSDictionary *attrs = @{NSFontAttributeName : titleLab.font};
    CGSize maxSize = CGSizeMake(120, kMaxHeight);
    CGRect controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil];
    titleLab.text = title;
    CGFloat titleLabWidth = controlSize.size.width+1;
    titleLab.frame = CGRectMake(0, 0, titleLabWidth, kMaxHeight);
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    imageV.image = [UIImage imageNamed:imageName];
    imageV.frame = CGRectMake(titleLabWidth, 0, kMaxHeight, kMaxHeight);
    [control addSubview:imageV];
    
    control.frame = CGRectMake(0, 0, kMaxHeight+controlSize.size.width+1, kMaxHeight);
    
    return [[UIBarButtonItem alloc] initWithCustomView:control];
}
@end
