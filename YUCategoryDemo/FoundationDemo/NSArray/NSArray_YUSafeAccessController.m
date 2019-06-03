//
//  NSArray_YUSafeAccessController.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/2/17.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "NSArray_YUSafeAccessController.h"

@interface NSArray_YUSafeAccessController ()

@end

@implementation NSArray_YUSafeAccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testReplaceObjectAtIndex];
}

- (void)testReplaceObjectAtIndex {
    NSMutableArray *arrM = [NSMutableArray arrayWithObjects:@"1", nil];
    YULog(@"%@", arrM);
    [arrM replaceObjectAtIndex:0 withObject:@"2"];
    YULog(@"%@", arrM);
}

- (void)testRemoveObjectAtIndex {
    NSMutableArray *arrM = [NSMutableArray arrayWithObjects:@"1", nil];
    YULog(@"%@", arrM);
    [arrM removeObjectAtIndex:1];
    YULog(@"%@", arrM);
}

- (void)testInsertObject {
    NSMutableArray *arrM = [NSMutableArray arrayWithObjects:@"1", nil];
    YULog(@"%@", arrM);
    [arrM insertObject:@"1" atIndex:2];
    YULog(@"%@", arrM);
}

- (void)testRemove {
    NSMutableArray *arrM = [NSMutableArray arrayWithObjects:@"1", @(2), @"3", nil];
    YULog(@"%@", arrM);
    BOOL success = [arrM yu_insertObject:@"4" atIndex:3];
    YULog(@"%d", success);
    [arrM insertObject:@"4" atIndex:4];
    YULog(@"%@", arrM);
    
    success = [arrM yu_removeObjectAtIndex:3];
    YULog(@"%d", success);
    YULog(@"%@", arrM);
    success = [arrM yu_replaceObjectAtIndex:3 withObject:@"5"];
    YULog(@"%d", success);
    YULog(@"%@", arrM);
}

@end
