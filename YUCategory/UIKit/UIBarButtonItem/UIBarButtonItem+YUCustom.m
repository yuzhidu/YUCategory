//
//  UIBarButtonItem+YUCustom.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 16/7/9.
//  Copyright © 2016年 mayubo. All rights reserved.
//

#import "UIBarButtonItem+YUCustom.h"

static const CGFloat kBarButtonHeight = 20.0f;
static const CGFloat kFontSize = 16.0f;
static const CGFloat kTitleMaxWidth = 120.0f;
static const CGFloat kTitleMaxHeight = 44.0f;

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
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    imageV.image = [UIImage imageNamed:imageName];
    imageV.frame = CGRectMake(0, 0, kBarButtonHeight, kBarButtonHeight);
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
    CGSize maxSize = CGSizeMake(kTitleMaxWidth, kTitleMaxHeight);
    CGRect controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil];
    titleLab.text = title;
    titleLab.frame = CGRectMake(0, 0, controlSize.size.width+1, kBarButtonHeight);
    
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
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    imageV.image = [UIImage imageNamed:imageName];
    imageV.frame = CGRectMake(0, 0, kBarButtonHeight, kBarButtonHeight);
    [control addSubview:imageV];
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:kFontSize];
    titleLab.textColor = kBarButtonItemCustomTitleColor;
    [control addSubview:titleLab];
    
    NSDictionary *attrs = @{NSFontAttributeName : titleLab.font};
    CGSize maxSize = CGSizeMake(kTitleMaxWidth, kTitleMaxHeight);
    CGRect controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil];
    titleLab.text = title;
    titleLab.frame = CGRectMake(kBarButtonHeight, 0, controlSize.size.width, kBarButtonHeight);
    
    control.frame = CGRectMake(0, 0, kBarButtonHeight+controlSize.size.width+1, kBarButtonHeight);
    
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
    CGSize maxSize = CGSizeMake(kTitleMaxWidth, kTitleMaxHeight);
    CGRect controlSize = [title boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attrs
                                             context:nil];
    titleLab.text = title;
    CGFloat titleLabWidth = controlSize.size.width+1;
    titleLab.frame = CGRectMake(0, 0, titleLabWidth, kBarButtonHeight);
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    imageV.image = [UIImage imageNamed:imageName];
    imageV.frame = CGRectMake(titleLabWidth, 0, kBarButtonHeight, kBarButtonHeight);
    [control addSubview:imageV];
    
    control.frame = CGRectMake(0, 0, kBarButtonHeight+controlSize.size.width+1, kBarButtonHeight);
    
    return [[UIBarButtonItem alloc] initWithCustomView:control];
}
@end
