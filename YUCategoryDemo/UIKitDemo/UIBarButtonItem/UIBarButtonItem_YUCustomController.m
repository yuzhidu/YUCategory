//
//  UIBarButtonItem_YUCustomViewController.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/2/16.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "UIBarButtonItem_YUCustomController.h"
#import "UIBarButtonItemDetailController.h"

@interface UIBarButtonItem_YUCustomController ()
/** 标题 */
@property (nonatomic, strong) NSArray<NSString *> *itemsTitle;
@end

@implementation UIBarButtonItem_YUCustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemsTitle count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
    }
    cell.detailTextLabel.text = self.itemsTitle[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIBarButtonItemDetailController *detailC = [[UIBarButtonItemDetailController alloc] init];
    detailC.row = indexPath.row;
    [self.navigationController pushViewController:detailC animated:YES];
}

- (NSArray<NSString *> *)itemsTitle {
    if (_itemsTitle == nil) {
        _itemsTitle = @[
                        @"1.0 图片：调整间隙，有高亮图，自定义宽高",
                        @"1.1 图片",
                        @"1.2 图片：有高亮图",
                        @"1.3 图片：调整间隙",
                        @"1.4 图片：有高亮图，调整间隙",
                        @"2.0 文字：自定义颜色、字体、间隙、高亮文字、高亮颜色、字体排列方式、控件大小",
                        @"2.1 文字：自定义颜色、字体",
                        @"2.2 文字：自定义颜色、字体、间隙",
                        ];
    }
    return _itemsTitle;
}

@end
