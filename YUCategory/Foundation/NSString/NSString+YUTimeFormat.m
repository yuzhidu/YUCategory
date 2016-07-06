//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  时间格式化为字符串
//

#import "NSString+YUTimeFormat.h"

@implementation NSString (YUTimeFormat)
/**
 *  将 “秒数” 转换为 几天几小时几分几秒
 */
+ (NSString *)yu_timeFormatted:(NSInteger)totalSeconds {
    NSInteger seconds = totalSeconds % 60;
    NSInteger minutes = (totalSeconds / 60) % 60;
    NSInteger hours = (totalSeconds / 3600) % 24;
    NSInteger days = totalSeconds / 86400;
    NSString *timeStr;
    if (!days && !hours && !minutes && !seconds) {
        timeStr = @"0秒";
    }
    else if (!days && !hours && !minutes) {
        timeStr = [NSString stringWithFormat:@"%ld秒", (long)seconds];
    }
    else if (!days && !hours) {
        timeStr = [NSString stringWithFormat:@"%ld分%ld秒",
                   (long)minutes, (long)seconds];
    }
    else if (!days) {
        timeStr = [NSString stringWithFormat:@"%ld小时%ld分%ld秒",
                   (long)hours, (long)minutes, (long)seconds];
    }
    else {
        timeStr = [NSString stringWithFormat:@"%ld天%ld小时%ld分%ld秒",
                   (long)days, (long)hours, (long)minutes, (long)seconds];
    }
    return timeStr;
}

@end
