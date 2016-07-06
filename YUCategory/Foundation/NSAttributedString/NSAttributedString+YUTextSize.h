//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  计算 属性字符串 的大小，指定最大值
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (YUTextSize)

/**
 *  计算 属性字符串 的大小
 *
 *  @param maxSize 最大尺寸
 *
 *  @return 计算后的尺寸
 */
- (CGSize)yu_sizeWithMaxSize:(CGSize)maxSize;

@end
