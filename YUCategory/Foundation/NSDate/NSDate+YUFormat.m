//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//
//  格式：@"yyyy-MM-dd HH:mm:ss"

#import "NSDate+YUFormat.h"

@implementation NSDate (YUFormat)

+ (NSString *)yu_dateFormatModeStringWith:(DateFormatMode)dateFormatMode {
    if (dateFormatMode == DateFormatModeNumber) {
        return @"yyyyMMdd";
    }
    else if (dateFormatMode == DateFormatModeMinus) {
        return @"yyyy-MM-dd";
    }
    else if (dateFormatMode == DateFormatModeInclinedLine) {
        return @"yyyy/MM/dd";
    }
    else if (dateFormatMode == DateFormatModeText) {
        return @"yyyy年MM月dd日";
    }
    return nil;
}

/**
 *  格式化当前(Now)日期
 *
 *  @param dateFormat 系统日期格式
 */
+ (NSString *)yu_dateWithSystemFormat:(DateFormatMode)dateFormatMode {
    return [self yu_dateWithFormat:[self yu_dateFormatModeStringWith:dateFormatMode]];
}
/**
 *  格式化指定日期，指定格式
 *
 *  @param dateFormat 系统日期格式
 */
+ (NSString *)yu_dateWith:(NSDate *)date systemDateFormat:(DateFormatMode)dateFormatMode {
    return [self yu_dateWith:date dateFormat:[self yu_dateFormatModeStringWith:dateFormatMode]];
}

/**
 *  格式化当前(Now)日期
 */
+ (NSString *)yu_dateWithFormat:(NSString *)dateFormat {
    
    return [self yu_dateWith:[NSDate date] dateFormat:dateFormat];
}

/**
 *  格式化指定日期，指定格式
 */
+ (NSString *)yu_dateWith:(NSDate *)date dateFormat:(NSString *)dateFormat {
    // 1.设定日期格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    
    // 2.日期转为字符串
    // localDateStr的值是北京时间
    NSString *localDateStr = [dateFormatter stringFromDate:date];
    
    return localDateStr;
}

/**
 *  格式化当前(Now)日期，后面拼接星期几
 */
+ (NSString *)yu_dateAppendWeekWith:(NSString *)dateFormat {
    
    return [self yu_dateAppendWeekWith:[NSDate date] dateFormat:dateFormat];
}
/**
 *  格式化指定日期，后面拼接星期几
 */
+ (NSString *)yu_dateAppendWeekWith:(NSDate *)date dateFormat:(NSString *)dateFormat {
    // 1.取得日期
    //    NSDate *date = [NSDate date];
    
    // 2.设定日期格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    
    // 3.日期转为字符串
    // localDateStr的值是北京时间
    NSString *localDateStr = [dateFormatter stringFromDate:date];
    
    // 4.取得 weekday symbol(会自动检测是否为中文状态)
    NSArray *weekdayArray = [dateFormatter weekdaySymbols];
    
    // 5.取得日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    NSInteger day = [dateComps weekday] - 1;
    
    // 6.设定日期字符串
    // formattedDateString格式=2015-11-30  星期一
    NSString *formattedDateString = [NSString stringWithFormat:@"%@  %@",localDateStr,[weekdayArray objectAtIndex:day]];
    
    return formattedDateString;
}

@end
