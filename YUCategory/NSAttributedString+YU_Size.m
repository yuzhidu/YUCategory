//
//  NSAttributedString+YU_Size.m
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//  使用环境:ARC
//  Version:1.0

#import "NSAttributedString+YU_Size.h"

@implementation NSAttributedString (YU_Size)

- (CGSize)yu_sizeWithMaxSize:(CGSize)maxSize
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
}

@end
