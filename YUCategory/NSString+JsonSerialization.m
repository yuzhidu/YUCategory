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

#import "NSString+JsonSerialization.h"

@implementation NSString (JsonSerialization)
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
        NSLog(@"NSString+JsonSerialization  Json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
