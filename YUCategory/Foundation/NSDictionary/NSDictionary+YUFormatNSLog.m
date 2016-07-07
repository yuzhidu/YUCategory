//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  格式化（“美化”）控制台输出的 字典
//

#import "NSDictionary+YUFormatNSLog.h"

@implementation NSDictionary (YUFormatNSLog)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@,\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}
@end
