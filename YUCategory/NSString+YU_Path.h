//
//  NSString+YU_Path.h
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Version:1.0

#import <Foundation/Foundation.h>

@interface NSString (YU_Path)

// 在字符串之前追加路径，拼接文件名在路径后

/** 追加缓存路径 */
- (NSString *)yu_appendCachePath;

/** 追加临时路径 */
- (NSString *)yu_appendTmpDirPath;

/** 追加文档路径 */
- (NSString *)yu_appendDocumentPath;

@end
