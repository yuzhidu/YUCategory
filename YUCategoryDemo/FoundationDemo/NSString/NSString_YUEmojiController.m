//
//  NSString_YUEmojiController.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/2/24.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "NSString_YUEmojiController.h"

@interface NSString_YUEmojiController ()

@property (nonatomic, weak) UITextField *textF;
@property (nonatomic, weak) UILabel *resultLab;
@end

@implementation NSString_YUEmojiController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *textF = [[UITextField alloc] init];
    self.textF = textF;
    textF.backgroundColor = mColorRandom;
    textF.frame = CGRectMake(20,100, self.view.yu_width-40, 32);
    [self.view addSubview:textF];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = mColorRandom;
    btn.frame = CGRectMake(30, textF.yu_yMax+20, self.view.yu_width-60, 30);
    [btn setTitle:@"检测" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel *resultLab = [[UILabel alloc] init];
    self.resultLab = resultLab;
    resultLab.backgroundColor = mColorRandom;
    resultLab.textAlignment = NSTextAlignmentCenter;
    resultLab.frame = CGRectMake(10, btn.yu_yMax+20, self.view.yu_width-20, 100);
    [self.view addSubview:resultLab];
    
    // 1. 替换代码 -> 表情符号编码
//    NSString *testStr1 = @"😀This is a smiley face :smiley:";
//    YULog(@"1->%@", [testStr1 yu_emojiCheatCodesReplacingWithUnicode]);
//
//    // 2. 表情符号编码 -> 替换代码
//    NSString *testStr2 = @"😀This is a smiley face \U0001F604";
//    YULog(@"2->%@", [testStr2 yu_emojiUnicodeReplacingWithCheatCodes]);
//
//    // 3. 是否包含表情
//    YULog(@"3.1->%d", [testStr1 yu_emojiIsIncluded]);
//    YULog(@"3.2->%d", [testStr2 yu_emojiIsIncluded]);
//
//    // 4. 删除表情
//    YULog(@"4->%@,长度%ld", [testStr2 yu_emojiRemoved], [[testStr2 yu_emojiRemoved] length]);
}

- (void)btnClick {
//    self.resultLab.text = [self.textF.text yu_emojiCheatCodesReplacingWithUnicode];
//    YULog(@"%@", [self.textF.text yu_emojiIsIncluded]?@"YES":@"NO");
//    YULog(@"%@", [self.textF.text yu_emojiUnicodeReplacingWithCheatCodes]);
}
@end
