//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  字符串空判断
// 一个或者多个空格也算是空
//

#import "NSString+YUEmpty.h"

@implementation NSString (YUEmpty)

/** 判断字符串是否为空 */
- (BOOL)yu_isEmpty {
    
    if (! self) {
        return YES;
    }
    else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return YES;
        }
        else {
            return NO;
        }
    }
}
@end
