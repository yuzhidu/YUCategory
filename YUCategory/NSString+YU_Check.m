//
//  NSString+YU_Check.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//  
//  Version:1.0

#import "NSString+YU_Check.h"

@implementation NSString (YU_Check)

// 一个或者多个空格也算是空
- (BOOL)yu_isEmpty {
    
    if (!self) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

/** 截断首部和尾部的空白字符 */
- (NSString *)yu_trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end
