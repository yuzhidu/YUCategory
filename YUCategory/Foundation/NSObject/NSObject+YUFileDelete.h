//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  删除沙盒文件
//

#import <Foundation/Foundation.h>

@interface NSObject (YUFileDelete)
/**
 *  1.删除 Document 目录下文件
 */
- (BOOL)yu_deleteDocumentFileWith:(NSString *)fileName;
/**
 *  2.删除 Library 目录下文件
 */
- (BOOL)yu_deleteLibraryFileWith:(NSString *)fileName;
/**
 *  3.删除 Caches 目录下文件
 */
- (BOOL)yu_deleteCachesFileWith:(NSString *)fileName;
/**
 *  4.删除 Tmp 目录下文件
 */
- (BOOL)yu_deleteTmpFileWith:(NSString *)fileName;

/**
 *  5.删除 指定目录下 文件
 */
- (BOOL)yu_deleteFileWithPathStr:(NSString *)pathStr fileName:(NSString *)fileName;

@end
