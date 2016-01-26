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

#import "NSDate+YU_Extension.h"

@implementation NSDate (YU_Extension)

+ (NSString *)yu_dateFormatModeStringWith:(DateFormatMode)dateFormatMode {
    if (dateFormatMode == DateFormatModeNumber) {
        return @"yyyyMMdd";
    } else if (dateFormatMode == DateFormatModeMinus) {
        return @"yyyy-MM-dd";
    } else if (dateFormatMode == DateFormatModeInclinedLine) {
        return @"yyyy/MM/dd";
    } else if (dateFormatMode == DateFormatModeText) {
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

//-----------------------------------------我是主人“裕之都”的分割线---------------------------//
/**
 *  是否为今天
 */
- (BOOL)yu_isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}
/**
 *  是否为昨天
 */
- (BOOL)yu_isYesterday
{
    // 2015-07-01
    NSDate *nowDate = [[NSDate date] yu_dateWithYMD];
    
    // 2015-06-30
    NSDate *selfDate = [self yu_dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}
/**
 *  是否为今年
 */
- (BOOL)yu_isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}
/**
 *  返回一个只有年月日的时间 @"yyyy-MM-dd"
 */
- (NSDate *)yu_dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

// 获得与当前时间的差距
- (NSDateComponents *)yu_deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay| NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}
@end
