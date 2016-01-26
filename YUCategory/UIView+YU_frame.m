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

#import "UIView+YU_frame.h"

@implementation UIView (YU_frame)

/** 当前View的x值*/
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

/** 当前View的y值*/
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

/** 当前View的宽*/
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

/** 当前View的高*/
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

/** 当前View的x最大值*/
- (void)setXMax:(CGFloat)xMax {
    CGRect frame = self.frame;
    frame.origin.x = xMax - frame.size.width;
    self.frame = frame;
}

- (CGFloat)xMax {
    return self.frame.origin.x + self.frame.size.width;
}

/** 当前View的y最大值*/
- (CGFloat)yMax {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYMax:(CGFloat)yMax {
    CGRect frame = self.frame;
    frame.origin.y = yMax - frame.size.height;
    self.frame = frame;
}

/** 当前View的中心x值*/
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

/** 当前View的中心y值*/
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

/** 当前View的大小*/
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

@end
