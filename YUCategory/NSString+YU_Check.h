//
//  NSString+YU_Check.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//  
//  Version:1.0
//  字符串检查

#import <Foundation/Foundation.h>

@interface NSString (YU_Check)

/** 判断字符串是否为空 */
- (BOOL)yu_isEmpty;

/** 截断首部和尾部的空白字符 */
- (NSString *)yu_trimString;
@end
