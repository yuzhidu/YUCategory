//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  计算 属性字符串 的大小，指定最大值
//

#import "NSAttributedString+YUTextSize.h"

@implementation NSAttributedString (YUTextSize)

- (CGSize)yu_sizeWithMaxSize:(CGSize)maxSize {
    
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                              context:nil].size;
}
@end
