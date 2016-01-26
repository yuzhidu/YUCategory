//
//  NSString+YU_Regex.m
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Version:1.0

#import "NSString+YU_Regex.h"

@implementation NSString (YU_Regex)

/**
 *  验证密码
 */
- (BOOL)yu_isValidatePassword
{
    //    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,32}";
    NSString *pattern = @"^[a-zA-Z0-9]{6,32}"; // 6-32位字母或数字组合
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
- (BOOL)yu_checkPhoneNumInput {
    // 以 1 开头的11位数字 即正确
    NSString * MOBILE = @"^(1)\\d{10}$";
    
    NSPredicate *regexMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    BOOL res = [regexMobile evaluateWithObject:self];
    
    if (res) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)yu_checkPhoneNumInputOld
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0235-9])\\d{8}$";
    
    // 移动
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    // 联通
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    // 电信
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    // 固话
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regexMOBILE = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regexCM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regexCU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regexCT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regexPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    BOOL res1 = [regexMOBILE evaluateWithObject:self];
    BOOL res2 = [regexCM evaluateWithObject:self];
    BOOL res3 = [regexCU evaluateWithObject:self];
    BOOL res4 = [regexCT evaluateWithObject:self];
    BOOL res5 = [regexPHS evaluateWithObject:self];
    
    if (res1 || res2 || res3 || res4 || res5) {
        return YES;
    } else {
        return NO;
    }
}

/** 查找字符串中第一个匹配项 */
- (NSString *)firstMatchWithPattern:(NSString *)pattern
{
    // 1. 实例化正则
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:pattern
                                  options:NSRegularExpressionCaseInsensitive
                                  | NSRegularExpressionDotMatchesLineSeparators
                                  error:&error];
    
    if (error) {
        NSLog(@"匹配模式不正确");
        
        return nil;
    }
    
    // 2. 匹配一项内容
    NSTextCheckingResult *firstMatch = [regex firstMatchInString:self
                                                         options:NSMatchingReportCompletion
                                                           range:NSMakeRange(0, self.length)];
    
    if (firstMatch) {
        // 返回第一个分组中内容
        NSRange range = [firstMatch rangeAtIndex:1];
        
        return [self substringWithRange:range];
    } else {
        NSLog(@"没有找到匹配内容");
    }
    
    return nil;
}

/** 查找字符串中所有匹配项 */
- (NSArray *)matchsWithPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators error:&error];
    
    if (error) {
        NSLog(@"匹配模式不正确");
        
        return nil;
    }
    
    // 匹配所有内容
    NSArray *array = [regex matchesInString:self
                                    options:NSMatchingReportCompletion
                                      range:NSMakeRange(0, self.length)];
    
    if (array == nil) {
        NSLog(@"没有找到匹配内容");
    }
    
    return array;
}

@end
