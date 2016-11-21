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

#import <Foundation/Foundation.h>

@interface NSString (YUTimeFormat)

/**
 *  将 “秒数” 转换为 几天几小时几分几秒
 */
+ (NSString *)yu_timeFormatted:(NSInteger)totalSeconds;

/**
 *  将 “秒数” 转换为 天:小时:分:秒
 */
+ (NSString *)yu_timeFormattedColon:(NSInteger)totalSeconds;
@end
