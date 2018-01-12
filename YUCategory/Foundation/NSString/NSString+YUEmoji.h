//
//  NSString+YUEmoji.h
//  YUCategoryDemo
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  emoji 表情符号
//
//  查询 emoji <http://emojipedia.org>

// 通过这个分类，能通过 表情符号替换表 把 替换代码 转换为 表情符号字符统一编码，
// 反之亦然（如果你需要发送一个消息类型到远程服务这个会非常有用）。


#import <Foundation/Foundation.h>

@interface NSString (YUEmoji)

- (BOOL)yubo_emojiContained;

- (NSString *)yu_emojiRemovedAll;

@end

///**
// 编码
// */
//- (NSString *)yu_emojiEncoding;
//
///**
// 解码
// */
//- (NSString *)yu_emojiDecoding;
//
///**
// 返回一个字符串
// 如果发现替换代码在表情符号替换表<http://www.emoji-cheat-sheet.com>中出现，
// 就会替换成相应的字符编码。
// 例如：
// "This is a smiley face :smiley:"
// 会被以下字符串替换：
// "This is a smiley face \U0001F604"
// */
//- (NSString *)yu_emojiCheatCodesReplacingWithUnicode;
//
///**
// 返回一个字符串
// 如果发现替换代码在表情符号替换表<http://www.emoji-cheat-sheet.com>中出现，
// 就会替换成相应的字符编码。
//
// 例如：
// "This is a smiley face \U0001F604"
// 会被以下字符串替换：
// "This is a smiley face :smiley:"
// */
//- (NSString *)yu_emojiUnicodeReplacingWithCheatCodes;
//
//
///**
// 是否包含 emoji
// */
//- (BOOL)yu_emojiIsIncluded;
//
///**
// 删除掉包含的emoji
// */
//- (instancetype)yu_emojiRemoved;
