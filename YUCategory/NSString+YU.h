//
//  NSString+YU.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Version:1.0
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (YU)

//--------------------- 1. Size 计算字符串尺寸 --------------------/
#pragma mark - 1. Size 计算字符串尺寸
/**
 *  根据 "字体" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  根据 "字体属性" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithAttributes:(NSDictionary *)attrs maxSize:(CGSize)maxSize;

//--------------------- 2. Regex 正则验证 --------------------/
#pragma mark - 2. Regex 正则验证
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
- (NSString *)yu_firstMatchWithPattern:(NSString *)pattern;

/**
 *  查找字符串中所有匹配项
 *
 *  @param pattern 匹配方案
 *
 *  @return 匹配数组（NSTextCheckingResult）
 */
- (NSArray *)yu_matchsWithPattern:(NSString *)pattern;

//--------------------- 3. Path 追加沙盒路径 --------------------/
#pragma mark - 3. Path 追加沙盒路径
// 在字符串之前追加路径，拼接文件名在路径后

/** 追加缓存路径 */
- (NSString *)yu_appendCachePath;

/** 追加临时路径 */
- (NSString *)yu_appendTmpDirPath;

/** 追加文档路径 */
- (NSString *)yu_appendDocumentPath;

//--------------------- 4. 加密 --------------------/
#pragma mark - 4. Hash 加密
@property (readonly) NSString *yu_md5String;    // MD5 加密
@property (readonly) NSString *yu_sha1String;
@property (readonly) NSString *yu_sha256String;
@property (readonly) NSString *yu_sha512String;

- (NSString *)yu_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)yu_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)yu_hmacSHA512StringWithKey:(NSString *)key;

//--------------------- 5. 字符串空判断 --------------------/
#pragma mark - 5. Check 字符串空判断
/** 判断字符串是否为空 */
- (BOOL)yu_isEmpty;

/** 截断首部和尾部的空白字符 */
- (NSString *)yu_trimString;

//--------------------- 6. base64 编解码 --------------------/
#pragma mark - 6. base64 编解码
/** base64编码 */
- (NSString *)yu_base64Encode;

/** base64解码 */
- (NSString *)yu_base64Decode;

@end
