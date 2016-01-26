//
//  UIView+YU_frame.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  使用环境:iOS7+ , ARC有效
//  Version:1.3

#import <UIKit/UIKit.h>

@interface UIView (YU_frame)

/** 当前View的x值*/
@property (nonatomic, assign) CGFloat x;

/** 当前View的y值*/
@property (nonatomic, assign) CGFloat y;

/** 当前View的宽*/
@property (nonatomic, assign) CGFloat width;

/** 当前View的高*/
@property (nonatomic, assign) CGFloat height;

/** 当前View的X最大值*/
@property (nonatomic, assign) CGFloat xMax;

/** 当前View的Y最大值*/
@property (nonatomic, assign) CGFloat yMax;

/** 当前View的中心x值*/
@property (nonatomic, assign) CGFloat centerX;

/** 当前View的中心y值*/
@property (nonatomic, assign) CGFloat centerY;

/** 当前View的大小*/
@property (nonatomic, assign) CGSize size;

@end
