//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  计算字符串尺寸
//

#import "NSString+YUSize.h"

@implementation NSString (YUSize)

/**
 *  根据 "字体" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

/**
 *  根据 "字体属性" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithAttributes:(NSDictionary *)attrs maxSize:(CGSize)maxSize {
    
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

@end
