//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  其它（暂时没有想好）
//

#import "NSString+YUOther.h"

@implementation NSString (YUOther)

#pragma mark - 最多保留2位小数，数字末尾去0，并且四舍五入
+ (NSString *)yu_stringChangeWithPrice:(CGFloat)value {
    NSString *changeStr = [NSString stringWithFormat:@"%f", value];
    return [self yu_stringChangeWithPriceStr:changeStr];
}
+ (NSString *)yu_stringChangeWithPriceStr:(NSString *)stringValue {
    NSString *changeStr = [NSString stringWithFormat:@"%.3f",[stringValue floatValue]];
    NSArray *componArr = [changeStr componentsSeparatedByString:@"."];
    NSString *firstStr = [componArr firstObject];
    NSString *lastStr = [componArr lastObject];
    
    int firstStrInt = [firstStr intValue];
    int lastInt  = [lastStr intValue];
    int firstInt = lastInt/100;
    int secInt = (lastInt%100)/10;
    int remainderInt = (lastInt%100)%10;
    
    if(remainderInt >= 5){
        secInt = secInt+1;
        if (secInt >= 10) {
            secInt = 0;
            firstInt = firstInt +1;
            if (firstInt >= 10) {
                firstInt = 0;
                firstStrInt = firstStrInt + 1;
            }
        }
    }
    
    NSString *finalStr;
    if (secInt == 0) {
        if (firstInt == 0) {
            finalStr = [NSString stringWithFormat:@"%d",firstStrInt];
        }
        else {
            finalStr = [NSString stringWithFormat:@"%d.%d",firstStrInt,firstInt];
        }
    }
    else {
        finalStr = [NSString stringWithFormat:@"%d.%d%d",firstStrInt,firstInt,secInt];
    }
    
    return finalStr;
}

#pragma mark - 截取字符串
/** 截断首部和尾部的空白字符 */
- (NSString *)yu_trimString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
