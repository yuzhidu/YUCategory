//
//  NSString+YU_Hash.h
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Version:1.1

#import <Foundation/Foundation.h>

@interface NSString (YU_Hash)

@property (readonly) NSString *yu_md5String;    // MD5 加密
@property (readonly) NSString *yu_sha1String;
@property (readonly) NSString *yu_sha256String;
@property (readonly) NSString *yu_sha512String;

- (NSString *)yu_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)yu_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)yu_hmacSHA512StringWithKey:(NSString *)key;

@end
