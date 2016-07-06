//
//  NSString+YUSerialization.m
//  YUCategoryDemo
//
//  Created by mayubo on 16/7/7.
//  Copyright © 2016年 mayubo. All rights reserved.
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
