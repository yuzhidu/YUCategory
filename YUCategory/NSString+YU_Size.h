//
//  NSString+YU_Size.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//  使用环境:ARC
//  Version:1.0

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (YU_Size)

/**
 *  根据 "字体" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  根据 "字体属性" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithAttributes:(NSDictionary *)attrs maxSize:(CGSize)maxSize;

@end
