//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//
//  判断日期
//

#import <Foundation/Foundation.h>

@interface NSDate (YUJudge)

/**
 *  是否为今天
 */
- (BOOL)yu_isToday;
/**
 *  是否为昨天
 */
- (BOOL)yu_isYesterday;
/**
 *  是否为今年
 */
- (BOOL)yu_isThisYear;

/**
 *  返回一个只有年月日的时间 @"yyyy-MM-dd"
 */
- (NSDate *)yu_dateWithYMD;

@end
