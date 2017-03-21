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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (YUOther)

#pragma mark - 最多保留2位小数，数字末尾去0，并且四舍五入
/**
 *  数字末尾去0
 */
+ (NSString *)yu_stringChangeWithPrice:(CGFloat)value;
/**
 *  数字末尾去0
 */
+ (NSString *)yu_stringChangeWithPriceStr:(NSString *)stringValue;

#pragma mark - 截取字符串
/** 截断首部和尾部的空白字符 */
- (NSString *)yu_trimString;

@end
