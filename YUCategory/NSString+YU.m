//
//  NSString+YU.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Version:1.1
//

#import "NSString+YU.h"

// Hash 加密
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (YU)

//-----------------------------------------------------------/
#pragma mark - 1. Size 计算字符串尺寸
/**
 *  根据 "字体" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

/**
 *  根据 "字体属性" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithAttributes:(NSDictionary *)attrs maxSize:(CGSize)maxSize {
    
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

//-----------------------------------------------------------/
#pragma mark - 2. Regex 正则验证

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
    return res;
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
- (NSString *)yu_firstMatchWithPattern:(NSString *)pattern
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
- (NSArray *)yu_matchsWithPattern:(NSString *)pattern
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


//--------------------- 3. Path 追加沙盒路径 --------------------/
#pragma mark - 3. Path 追加沙盒路径
- (NSString *)yu_appendCachePath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [path stringByAppendingPathComponent:self];
}

- (NSString *)yu_appendTmpDirPath
{
    NSString *path = NSTemporaryDirectory();
    
    return [path stringByAppendingPathComponent:self];
}

- (NSString *)yu_appendDocumentPath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    return [path stringByAppendingPathComponent:self];
}


//--------------------- 4. 加密 --------------------/
#pragma mark - 4. Hash 加密
- (NSString *)yu_md5String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self yu_stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)yu_sha1String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(string, length, bytes);
    return [self yu_stringFromBytes:bytes length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)yu_sha256String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(string, length, bytes);
    return [self yu_stringFromBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)yu_sha512String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(string, length, bytes);
    return [self yu_stringFromBytes:bytes length:CC_SHA512_DIGEST_LENGTH];
}

- (NSString *)yu_hmacSHA1StringWithKey:(NSString *)key
{
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *messageData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *mutableData = [NSMutableData dataWithLength:CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, keyData.bytes, keyData.length, messageData.bytes, messageData.length, mutableData.mutableBytes);
    return [self yu_stringFromBytes:(unsigned char *)mutableData.bytes length:mutableData.length];
}

- (NSString *)yu_hmacSHA256StringWithKey:(NSString *)key
{
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *messageData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *mutableData = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, keyData.bytes, keyData.length, messageData.bytes, messageData.length, mutableData.mutableBytes);
    return [self yu_stringFromBytes:(unsigned char *)mutableData.bytes length:mutableData.length];
}

- (NSString *)yu_hmacSHA512StringWithKey:(NSString *)key
{
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *messageData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *mutableData = [NSMutableData dataWithLength:CC_SHA512_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA512, keyData.bytes, keyData.length, messageData.bytes, messageData.length, mutableData.mutableBytes);
    return [self yu_stringFromBytes:(unsigned char *)mutableData.bytes length:mutableData.length];
}

#pragma mark - Helpers
- (NSString *)yu_stringFromBytes:(unsigned char *)bytes length:(NSInteger)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}

//--------------------- 5. 字符串空判断 --------------------/
#pragma mark - 5. Check 字符串空判断
// 一个或者多个空格也算是空
- (BOOL)yu_isEmpty {
    
    if (!self) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

/** 截断首部和尾部的空白字符 */
- (NSString *)yu_trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//--------------------- 6. base64 编解码 --------------------/
#pragma mark - 6. base64 编解码
// base64编码
- (NSString *)yu_base64Encode
{
    // 1. 将字符串转换成二进制数据
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    // 返回base64编码后的字符串
    return [data base64EncodedStringWithOptions:0];
}

// base64解码
- (NSString *)yu_base64Decode
{
    // 1. 使用base64编码的字符串创建二进制数据
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    // 2. 返回base64解码后的字符串
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

//--------------------- 7. 最多保留2位小数，数字末尾去0，并且四舍五入 --------------------/

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
        } else {
            finalStr = [NSString stringWithFormat:@"%d.%d",firstStrInt,firstInt];
        }
    } else {
        finalStr = [NSString stringWithFormat:@"%d.%d%d",firstStrInt,firstInt,secInt];
    }
    
    return finalStr;
}

//--------------------- 8. 将输入的 “秒数” 转换为 几天几小时几分几秒 --------------------/
+ (NSString *)yu_timeFormatted:(NSInteger)totalSeconds
{
    NSInteger seconds = totalSeconds % 60;
    NSInteger minutes = (totalSeconds / 60) % 60;
    NSInteger hours = (totalSeconds / 3600) % 24;
    NSInteger days = totalSeconds / 86400;
    NSString *timeStr;
    if (!days && !hours && !minutes && !seconds) {
        timeStr = @"0秒";
    } else if (!days && !hours && !minutes) {
        timeStr = [NSString stringWithFormat:@"%ld秒", (long)seconds];
    } else if (!days && !hours) {
        timeStr = [NSString stringWithFormat:@"%ld分%ld秒", (long)minutes, (long)seconds];
    } else if (!days) {
        timeStr = [NSString stringWithFormat:@"%ld小时%ld分%ld秒", (long)hours, (long)minutes, (long)seconds];
    } else {
        timeStr = [NSString stringWithFormat:@"%ld天%ld小时%ld分%ld秒", (long)days, (long)hours, (long)minutes, (long)seconds];
    }
    return timeStr;
}

//--------------------- 9. Json 反序列化为 NSDictionary --------------------/
- (NSDictionary *)yu_serializationJsonStringToDictionary {
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
#ifdef DEBUG
        NSLog(@"NSString+JsonSerialization  Json解析失败：%@",err);
#endif
        return nil;
    }
    return dic;
}

@end
