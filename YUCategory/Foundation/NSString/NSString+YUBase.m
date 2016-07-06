//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  base64 编解码
//

#import "NSString+YUBase.h"

@implementation NSString (YUBase)

/** base64编码 */
- (NSString *)yu_base64Encode {
    
    // 将字符串转换成二进制数据
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    // 返回base64编码后的字符串
    return [data base64EncodedStringWithOptions:0];
}

/** base64解码 */
- (NSString *)yu_base64Decode {
    
    // 使用base64编码的字符串创建二进制数据
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    // 返回base64解码后的字符串
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
