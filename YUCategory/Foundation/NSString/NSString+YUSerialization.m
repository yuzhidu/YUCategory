//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Json 串 反序列化为 NSDictionary
//

#import "NSString+YUSerialization.h"

@implementation NSString (YUSerialization)
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
