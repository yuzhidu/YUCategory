//
//  NSObject+YUComputeSize.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/5/27.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "NSObject+YUComputeSize.h"

@implementation NSObject (YUComputeSize)

+ (CGSize)yu_computeSizeWith:(CGSize)current maxSize:(CGSize)max {
    
    CGFloat currentRate = current.width/current.height;
    CGFloat maxRate = max.width/max.height;
    
    CGFloat resultW = 0;
    CGFloat resultH = 0;
    
    if (currentRate > maxRate) { // 大于说明 只需要限制宽度
        
        if (current.width > max.width) {
            resultW = max.width;
            resultH = max.width / currentRate;
        } else {
            resultW = current.width;
            resultH = current.height;
        }
        
    } else { // 限制高度
        
        if (current.height > max.height) {
            resultH = max.height;
            resultW = max.height * currentRate;
        } else {
            resultW = current.width;
            resultH = current.height;
        }
    }
    
    return CGSizeMake(resultW, resultH);
}

@end
