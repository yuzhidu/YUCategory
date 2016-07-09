//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//
//  其它
//

#import "NSDate+YUOther.h"

@implementation NSDate (YUOther)
// 获得与当前时间的差距
- (NSDateComponents *)yu_deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    
    return [calendar components:unit
                       fromDate:self
                         toDate:[NSDate date]
                        options:0];
}
@end
