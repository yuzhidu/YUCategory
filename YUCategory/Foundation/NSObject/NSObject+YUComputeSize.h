//
//  NSObject+YUComputeSize.h
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/5/27.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YUComputeSize)

/// 使用场景：聊天时传入原图的大小，限制宽高的最大值（一般宽度不超过屏幕），
/// 计算等比缩小后的大小，如果图片的宽高都不超过 maxSize，是不会缩小的。

/**
 根据传入的尺寸，限制最大尺寸，计算限制后的尺寸。
 
 @param current 本来宽高
 @param max 限制最大值
 @return 计算后的宽高
 */
+ (CGSize)yu_computeSizeWith:(CGSize)current maxSize:(CGSize)max;

@end
