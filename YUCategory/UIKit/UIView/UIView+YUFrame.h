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

#import <UIKit/UIKit.h>

@interface UIView (YUFrame)

/** 1.当前View的x值*/
@property (nonatomic, assign) CGFloat yu_x;

/** 2.当前View的X最大值*/
@property (nonatomic, assign) CGFloat yu_xMax;

/** 3.当前View的y值*/
@property (nonatomic, assign) CGFloat yu_y;

/** 4.当前View的Y最大值*/
@property (nonatomic, assign) CGFloat yu_yMax;

//---------------------
/** 1.当前View的left值，对应x */
@property (nonatomic, assign) CGFloat yu_left;

/** 2.当前View的right值，对应xMax */
@property (nonatomic, assign) CGFloat yu_right;

/** 3.当前View的top值，对应y */
@property (nonatomic, assign) CGFloat yu_top;

/** 4.当前View的bottom值，对应yMax */
@property (nonatomic, assign) CGFloat yu_bottom;
//---------------------

/** 5.当前View的宽*/
@property (nonatomic, assign) CGFloat yu_width;

/** 6.当前View的高*/
@property (nonatomic, assign) CGFloat yu_height;

/** 7.当前View的中心x值*/
@property (nonatomic, assign) CGFloat yu_centerX;

/** 8.当前View的中心y值*/
@property (nonatomic, assign) CGFloat yu_centerY;

/** 9.当前View的大小*/
@property (nonatomic, assign) CGSize yu_size;

@end
