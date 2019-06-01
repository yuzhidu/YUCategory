//
//  NSDictionary_YUSafeAccessController.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/2/16.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "NSDictionary_YUSafeAccessController.h"

@interface NSDictionary_YUSafeAccessController ()

@end

@implementation NSDictionary_YUSafeAccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testDict];
}

- (void)testDict {
    NSDictionary *dict = @{@"name": @"jack"};
    YULog(@"%d", [dict yu_hasKey:@"name"]);
    YULog(@"%d", [dict yu_hasKey:@"n"]);
    YULog(@"%@", [dict allKeys]);
}

@end
