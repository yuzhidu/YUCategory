//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  字符串匹配
//

#import <Foundation/Foundation.h>

@interface NSString (YUMatch)

/**
 *  查找字符串中第一个匹配项
 *
 *  @param pattern 目标字符串
 *
 *  @return 结果字符串
 */
- (NSString *)yu_firstMatchWithPattern:(NSString *)pattern;

/**
 *  查找字符串中所有匹配项
 *
 *  @param pattern 匹配方案
 *
 *  @return 匹配数组（NSTextCheckingResult）
 */
- (NSArray *)yu_matchsWithPattern:(NSString *)pattern;

@end
