//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  字符串匹配
//

#import "NSString+YUMatch.h"

@implementation NSString (YUMatch)
/** 查找字符串中第一个匹配项 */
- (NSString *)yu_firstMatchWithPattern:(NSString *)pattern
{
    // 1. 实例化正则
    NSError *error = nil;
    NSRegularExpression *regex =
        [NSRegularExpression regularExpressionWithPattern:pattern
                                                  options:NSRegularExpressionCaseInsensitive |NSRegularExpressionDotMatchesLineSeparators
                                                    error:&error];
    
    if (error) {
#ifdef DEBUG
        NSLog(@"匹配模式不正确");
#endif
        return nil;
    }
    
    // 2. 匹配一项内容
    NSTextCheckingResult *firstMatch = [regex firstMatchInString:self
                                                         options:NSMatchingReportCompletion
                                                           range:NSMakeRange(0, self.length)];
    
    if (firstMatch) {
        // 返回第一个分组中内容
        NSRange range = [firstMatch rangeAtIndex:1];
        
        return [self substringWithRange:range];
    }
    else {
#ifdef DEBUG
        NSLog(@"没有找到匹配内容");
#endif
    }
    
    return nil;
}

/** 查找字符串中所有匹配项 */
- (NSArray *)yu_matchsWithPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators error:&error];
    
    if (error) {
#ifdef DEBUG
        NSLog(@"匹配模式不正确");
#endif
        return nil;
    }
    
    // 匹配所有内容
    NSArray *array = [regex matchesInString:self
                                    options:NSMatchingReportCompletion
                                      range:NSMakeRange(0, self.length)];
    
    if (array == nil) {
#ifdef DEBUG
        NSLog(@"没有找到匹配内容");
#endif
    }
    
    return array;
}
@end
