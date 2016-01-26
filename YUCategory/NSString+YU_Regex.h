//
//  NSString+YU_Regex.h
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Version:1.0
//  正则验证

#import <Foundation/Foundation.h>

@interface NSString (YU_Regex)
/**
 *  验证密码
 */
- (BOOL)yu_isValidatePassword;

/**
 *  手机号正则验证
 */
- (BOOL)yu_checkPhoneNumInput;

/**
 *  手机号正则验证 (旧方法)
 */
- (BOOL)yu_checkPhoneNumInputOld;

/**
 *  查找字符串中第一个匹配项
 *
 *  @param pattern 匹配方案
 *
 *  @return 第一个匹配字符串
 */
- (NSString *)firstMatchWithPattern:(NSString *)pattern;

/**
 *  查找字符串中所有匹配项
 *
 *  @param pattern 匹配方案
 *
 *  @return 匹配数组（NSTextCheckingResult）
 */
- (NSArray *)matchsWithPattern:(NSString *)pattern;

@end
