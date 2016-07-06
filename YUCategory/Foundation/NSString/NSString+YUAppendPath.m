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

#import "NSString+YUAppendPath.h"

@implementation NSString (YUAppendPath)

- (NSString *)yu_appendPathCache
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                          NSUserDomainMask,
                                                          YES)
                      lastObject];
    return [path stringByAppendingPathComponent:self];
}

- (NSString *)yu_appendPathTmpDir
{
    NSString *path = NSTemporaryDirectory();
    
    return [path stringByAppendingPathComponent:self];
}

- (NSString *)yu_appendPathDocument
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                          NSUserDomainMask,
                                                          YES)
                      lastObject];
    return [path stringByAppendingPathComponent:self];
}
@end
