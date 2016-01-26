//
//  NSString+YU_Path.m
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Version:1.0

#import "NSString+YU_Path.h"

@implementation NSString (YU_Path)

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

@end
