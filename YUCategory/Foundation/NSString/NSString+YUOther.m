//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  其它（暂时没有想好）
//

#import "NSString+YUOther.h"

@implementation NSString (YUOther)

#pragma mark - 最多保留2位小数，数字末尾去0，并且四舍五入
+ (NSString *)yu_stringChangeWithPrice:(CGFloat)value {
    NSString *changeStr = [NSString stringWithFormat:@"%f", value];
    return [self yu_stringChangeWithPriceStr:changeStr];
}
+ (NSString *)yu_stringChangeWithPriceStr:(NSString *)stringValue {
    NSString *changeStr = [NSString stringWithFormat:@"%.3f",[stringValue floatValue]];
    NSArray *componArr = [changeStr componentsSeparatedByString:@"."];
    NSString *firstStr = [componArr firstObject];
    NSString *lastStr = [componArr lastObject];
    
    int firstStrInt = [firstStr intValue];
    int lastInt  = [lastStr intValue];
    int firstInt = lastInt/100;
    int secInt = (lastInt%100)/10;
    int remainderInt = (lastInt%100)%10;
    
    if(remainderInt >= 5){
        secInt = secInt+1;
        if (secInt >= 10) {
            secInt = 0;
            firstInt = firstInt +1;
            if (firstInt >= 10) {
                firstInt = 0;
                firstStrInt = firstStrInt + 1;
            }
        }
    }
    
    NSString *finalStr;
    if (secInt == 0) {
        if (firstInt == 0) {
            finalStr = [NSString stringWithFormat:@"%d",firstStrInt];
        }
        else {
            finalStr = [NSString stringWithFormat:@"%d.%d",firstStrInt,firstInt];
        }
    }
    else {
        finalStr = [NSString stringWithFormat:@"%d.%d%d",firstStrInt,firstInt,secInt];
    }
    
    return finalStr;
}

#pragma mark - 截取字符串
/** 截断首部和尾部的空白字符 */
- (NSString *)yu_trimString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//------------------------以下方法已经没用-----------------------/
#pragma mark - Regex 正则验证
/**
 *  密码正则验证(6-32位字母或数字组合)
 */
- (BOOL)yu_isValidatePassword {
    //    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,32}";
    NSString *pattern = @"^[a-zA-Z0-9]{6,32}"; // 6-32位字母或数字组合
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
/**
 *  手机号正则验证(以1开头11位数字)
 */
- (BOOL)yu_checkPhoneNumInput {
    // 以 1 开头的11位数字 即正确
    NSString * MOBILE = @"^(1)\\d{10}$";
    
    NSPredicate *regexMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    BOOL res = [regexMobile evaluateWithObject:self];
    return res;
}
/**
 *  手机号正则验证 (旧方法)
 */
- (BOOL)yu_checkPhoneNumInputOld {
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

@end
