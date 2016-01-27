//
//  NSString+YU_Size.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//  使用环境:ARC
//  Version:1.0

#import "NSString+YU_Size.h"

// Fragment 碎片
// NSStringDrawingUsesLineFragmentOrigin
// The specified origin is the line fragment origin, not the base line origin

// NSStringDrawingUsesFontLeading
// Uses the font leading for calculating line heights

// NSStringDrawingUsesDeviceMetrics
// Uses image glyph bounds instead of typographic bounds

// NSStringDrawingTruncatesLastVisibleLine
// Truncates and adds the ellipsis character to the last visible line if the text doesn't fit into the bounds specified. Ignored if NSStringDrawingUsesLineFragmentOrigin is not also set.


@implementation NSString (YU_Size)

- (CGSize)yu_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)yu_sizeWithAttributes:(NSDictionary *)attrs maxSize:(CGSize)maxSize
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setMinimumLineHeight:24.0f];
//    [paragraphStyle setMaximumLineHeight:24.0f];
//    paragraphStyle.paragraphSpacingBefore = 1.0f;
//    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
//    [paragraphStyle setLineSpacing:4.0f];
//    [paragraphStyle setParagraphSpacing:24.0f];
//    NSDictionary *attrs = @{NSFontAttributeName : font, NSParagraphStyleAttributeName : paragraphStyle};

//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
//    paragraphStyle.alignment = label.textAlignment;
//    [paragraphStyle setLineSpacing:6.0f];
//    NSDictionary *attrs = @{NSFontAttributeName : font, NSParagraphStyleAttributeName : paragraphStyle};

@end
