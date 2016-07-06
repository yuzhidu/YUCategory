//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Path 追加沙盒路径
//  在字符串之前追加路径，文件名在路径最后
//

#import <Foundation/Foundation.h>

@interface NSString (YUAppendPath)

/** 追加缓存路径 */
- (NSString *)yu_appendPathCache;

/** 追加临时路径 */
- (NSString *)yu_appendPathTmpDir;

/** 追加文档路径 */
- (NSString *)yu_appendPathDocument;

@end
