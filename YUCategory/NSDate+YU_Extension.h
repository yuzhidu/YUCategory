//
//  NSDate+YU_Extension.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//  
//  Version:1.2

//  格式：@"yyyy-MM-dd HH:mm:ss"

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DateFormatMode) {
    /** 年月日  例如:20160101 */
    DateFormatModeNumber,
    
    /** 年-月-日  例如:2015-12-21 */
    DateFormatModeMinus,
    
    /** 年/月/日  例如:2015/12/21 */
    DateFormatModeInclinedLine,
    
    /** x年x月x日  例如:2016年01月01日 */
    DateFormatModeText
};

@interface NSDate (YU_Extension)

/**
 *  1.1 格式化当前(Now)日期
 *
 *  @param dateFormat 系统日期格式
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)yu_dateWithSystemFormat:(DateFormatMode)dateFormatMode;
/**
 *  1.2 格式化指定日期，指定格式
 *
 *  @param dateFormat 系统日期格式
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)yu_dateWith:(NSDate *)date systemDateFormat:(DateFormatMode)dateFormatMode;

/**
 *  2.1 格式化当前(Now)日期
 *
 *  @param dateFormat 日期格式
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)yu_dateWithFormat:(NSString *)dateFormat;

/**
 *  2.2 格式化指定日期，指定格式
 *
 *  @param date       被格式化的日期
 *  @param dateFormat 日期格式
 *
 *  @return 字符串：格式化后的
 */
+ (NSString *)yu_dateWith:(NSDate *)date dateFormat:(NSString *)dateFormat;

/**
 *  3.1 格式化当前(Now)日期，后面拼接星期几
 *
 *  @param dateFormat 日期格式
 *
 *  @return 字符串：格式化后的
 */
+ (NSString *)yu_dateAppendWeekWith:(NSString *)dateFormat;

/**
 *  3.2 格式化指定日期，后面拼接星期几
 *
 *  @param dateFormat 日期格式
 *
 *  @return 字符串：格式化后的
 */
+ (NSString *)yu_dateAppendWeekWith:(NSDate *)date dateFormat:(NSString *)dateFormat;

//-----------------------------------------我是主人“裕之都”的分割线---------------------------//
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

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)yu_deltaWithNow;
@end
