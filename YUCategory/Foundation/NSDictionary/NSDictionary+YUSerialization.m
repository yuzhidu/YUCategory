//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  将字典 序列化为 Json 串
//

#import "NSDictionary+YUSerialization.h"

@implementation NSDictionary (YUSerialization)
- (NSString *)yu_serializationNSDictionaryToJson {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (! jsonData) {
#ifdef DEBUG
        NSLog(@"NSDictionary+Serialization error: %@", error.localizedDescription);
#endif
        return nil;
    }
    else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}
@end
