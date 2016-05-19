//
//  NSString+JsonSerialization.h
//  YUCategoryDemo
//
//  Created by 马裕博 on 16/5/19.
//  Copyright © 2016年 mayubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JsonSerialization)

- (NSDictionary *)yu_serializationJsonStringToDictionary;

@end
