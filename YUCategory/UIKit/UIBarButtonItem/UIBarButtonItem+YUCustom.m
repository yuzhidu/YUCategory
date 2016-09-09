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

static const CGFloat kMaxHeight = 30.f;
static const CGFloat kFontSize = 15.f;
static const CGFloat kTitleMaxWidth = 120.f;

#define kBarButtonItemCustomTitleColor     [UIColor whiteColor]

@implementation UIBarButtonItem (YUCustom)
/**
 *  1.只有图片
 */
+ (UIBarButtonItem *)yu_barButtonWithImage:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action {
    
    UIControl *control = [[UIControl alloc] init];
    [control addTarget:target
                action:action
      forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.contentMode = UIViewContentModeCenter;
    imageV.image = [UIImage imageNamed:imageName];
    imageV.frame = CGRectMake(0, 0, kMaxHeight, kMaxHeight);
    [control addSubview:imageV];
    control.frame = imageV.frame;
    
    return [[UIBarButtonItem alloc] initWithCustomView:control];
}

/**
 *  2.只有文字
 */
+ (UIBarButtonItem *)yu_barButtonWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action {
    
    UIControl *control = [[UIControl alloc] init];
    [control addTarget:target
                action:action
      forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:kFontSize];
    titleLab.textColor = kBarButtonItemCustomTitleColor;
    [control addSubview:titleLab];
    
    NSDictionary *attrs = @{NSFontAttributeName : titleLab.font};
    CGSize maxSize = CGSizeMake(kTitleMaxWidth, kMaxHeight);
    CGRect controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil];
    titleLab.text = title;
    titleLab.frame = CGRectMake(0, 0, controlSize.size.width+1, kMaxHeight);
    
    control.frame = titleLab.frame;
    
    return [[UIBarButtonItem alloc] initWithCustomView:control];
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
    imageV.contentMode = UIViewContentModeCenter;
    imageV.image = [UIImage imageNamed:imageName];
    imageV.frame = CGRectMake(0, 0, kMaxHeight, kMaxHeight);
    [control addSubview:imageV];
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:kFontSize];
    titleLab.textColor = kBarButtonItemCustomTitleColor;
    [control addSubview:titleLab];
    
    NSDictionary *attrs = @{NSFontAttributeName : titleLab.font};
    CGSize maxSize = CGSizeMake(kTitleMaxWidth, kMaxHeight);
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
    titleLab.textColor = kBarButtonItemCustomTitleColor;
    [control addSubview:titleLab];
    
    NSDictionary *attrs = @{NSFontAttributeName : titleLab.font};
    CGSize maxSize = CGSizeMake(kTitleMaxWidth, kMaxHeight);
    CGRect controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil];
    titleLab.text = title;
    CGFloat titleLabWidth = controlSize.size.width+1;
    titleLab.frame = CGRectMake(0, 0, titleLabWidth, kMaxHeight);
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.contentMode = UIViewContentModeCenter;
    imageV.image = [UIImage imageNamed:imageName];
    imageV.frame = CGRectMake(titleLabWidth, 0, kMaxHeight, kMaxHeight);
    [control addSubview:imageV];
    
    control.frame = CGRectMake(0, 0, kMaxHeight+controlSize.size.width+1, kMaxHeight);
    
    return [[UIBarButtonItem alloc] initWithCustomView:control];
}
@end
