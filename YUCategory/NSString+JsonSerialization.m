//
//  NSString+JsonSerialization.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 16/5/19.
//  Copyright © 2016年 mayubo. All rights reserved.
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
