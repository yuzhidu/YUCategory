//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  使用Frame布局技术
//

#import "UIView+YUFrame.h"

@implementation UIView (YUFrame)
/** 1.当前View的x值*/
- (void)setYu_x:(CGFloat)yu_x {
    CGRect frame = self.frame;
    frame.origin.x = yu_x;
    self.frame = frame;
}
- (CGFloat)yu_x {
    return self.frame.origin.x;
}

/** 2.当前View的x最大值*/
- (void)setYu_xMax:(CGFloat)yu_xMax {
    CGRect frame = self.frame;
    frame.origin.x = yu_xMax - frame.size.width;
    self.frame = frame;
}
- (CGFloat)yu_xMax {
    return self.frame.origin.x + self.frame.size.width;
}

/** 3.当前View的y值*/
- (void)setYu_y:(CGFloat)yu_y {
    CGRect frame = self.frame;
    frame.origin.y = yu_y;
    self.frame = frame;
}
- (CGFloat)yu_y {
    return self.frame.origin.y;
}

/** 4.当前View的y最大值*/
- (void)setYu_yMax:(CGFloat)yu_yMax {
    CGRect frame = self.frame;
    frame.origin.y = yu_yMax - frame.size.height;
    self.frame = frame;
}
- (CGFloat)yu_yMax {
    return self.frame.origin.y + self.frame.size.height;
}

//---------------------
/** 1.当前View的left值，对应x */
- (void)setYu_left:(CGFloat)yu_left {
    CGRect frame = self.frame;
    frame.origin.x = yu_left;
    self.frame = frame;
}
- (CGFloat)yu_left {
    return self.frame.origin.x;
}

/** 2.当前View的right值，对应xMax */
- (void)setYu_right:(CGFloat)yu_right {
    CGRect frame = self.frame;
    frame.origin.x = yu_right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)yu_right {
    return self.frame.origin.x + self.frame.size.width;
}

/** 3.当前View的top值，对应y */
- (void)setYu_top:(CGFloat)yu_top {
    CGRect frame = self.frame;
    frame.origin.y = yu_top;
    self.frame = frame;
}
- (CGFloat)yu_top {
    return self.frame.origin.y;
}

/** 4.当前View的bottom值，对应yMax */
- (void)setYu_bottom:(CGFloat)yu_bottom {
    CGRect frame = self.frame;
    frame.origin.y = yu_bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)yu_bottom {
    return self.frame.origin.y + self.frame.size.height;
}
//---------------------

/** 5.当前View的宽*/
- (void)setYu_width:(CGFloat)yu_width {
    CGRect frame = self.frame;
    frame.size.width = yu_width;
    self.frame = frame;
}
- (CGFloat)yu_width {
    return self.frame.size.width;
}

/** 6.当前View的高*/
- (void)setYu_height:(CGFloat)yu_height {
    CGRect frame = self.frame;
    frame.size.height = yu_height;
    self.frame = frame;
}
- (CGFloat)yu_height {
    return self.frame.size.height;
}

/** 7.当前View的中心x值*/
- (void)setYu_centerX:(CGFloat)yu_centerX {
    CGPoint center = self.center;
    center.x = yu_centerX;
    self.center = center;
}
- (CGFloat)yu_centerX {
    return self.center.x;
}

/** 8.当前View的中心y值*/
- (void)setYu_centerY:(CGFloat)yu_centerY {
    CGPoint center = self.center;
    center.y = yu_centerY;
    self.center = center;
}
- (CGFloat)yu_centerY {
    return self.center.y;
}

/** 9.当前View的大小*/
- (void)setYu_size:(CGSize)yu_size {
    CGRect frame = self.frame;
    frame.size = yu_size;
    self.frame = frame;
}
- (CGSize)yu_size {
    return self.frame.size;
}
@end
