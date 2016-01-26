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
//  Version:1.4

#import <UIKit/UIKit.h>

@interface UIView (YU_frame)

/** 当前View的x值*/
@property (nonatomic, assign) CGFloat yu_x;

/** 当前View的y值*/
@property (nonatomic, assign) CGFloat yu_y;

/** 当前View的宽*/
@property (nonatomic, assign) CGFloat yu_width;

/** 当前View的高*/
@property (nonatomic, assign) CGFloat yu_height;

/** 当前View的X最大值*/
@property (nonatomic, assign) CGFloat yu_xMax;

/** 当前View的Y最大值*/
@property (nonatomic, assign) CGFloat yu_yMax;

/** 当前View的中心x值*/
@property (nonatomic, assign) CGFloat yu_centerX;

/** 当前View的中心y值*/
@property (nonatomic, assign) CGFloat yu_centerY;

/** 当前View的大小*/
@property (nonatomic, assign) CGSize yu_size;

@end
