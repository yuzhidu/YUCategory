//
//  NSString_YUEmptyController.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/2/16.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "NSString_YUEmptyController.h"

@interface NSString_YUEmptyController ()

@end

@implementation NSString_YUEmptyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testNil];
}

- (void)testNil {
    NSString *a = nil;
    YULog(@"%d", [a isKindOfClass:[NSString class]]);
    a = @"A";
    YULog(@"%d", [a isKindOfClass:[NSString class]]);
    a = @"/";
    YULog(@"%d", [a isKindOfClass:[NSString class]]);
}

@end
