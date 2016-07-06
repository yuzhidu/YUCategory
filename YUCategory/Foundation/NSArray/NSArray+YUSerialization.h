//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  将数组 序列化为 Json 串
//

#import <Foundation/Foundation.h>

@interface NSArray (YUSerialization)
/**
 *  将“数组”序列化为 Json串
 *
 *  @return 返回nil 表示序列化失败
 */
- (NSString *)yu_serializationNSArrayToJson;
@end
