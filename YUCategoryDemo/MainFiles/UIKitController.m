//
//  ViewController.m
//  YUCategoryDemo
//
//  Created by mayubo on 16/1/26.
//  Copyright © 2016年 mayubo. All rights reserved.
//

#import "UIKitController.h"

@interface UIKitController ()
/** 标题 */
@property (nonatomic, strong) NSArray<NSString *> *itemsTitle;
@property (nonatomic, strong) NSArray<NSArray *> *itemsSubTitle;
@end

@implementation UIKitController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kColorBackground;
    
    self.navigationItem.title = @"UIKit分类";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.itemsTitle count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemsSubTitle[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
    }
    cell.detailTextLabel.text = self.itemsSubTitle[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.itemsTitle[section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *name =  self.itemsSubTitle[indexPath.section][indexPath.row];
    NSString *className = [name stringByAppendingString:@"Controller"];
    className = [className stringByReplacingOccurrencesOfString:@"+" withString:@"_"];
    Class class = NSClassFromString(className);
    UIViewController *controller = [[class alloc] init];
    controller.title = name;
    controller.view.backgroundColor = kColorBackground;
    controller.navigationItem.leftBarButtonItem = [UIBarButtonItem yu_barButtonWithImage:@"arrowBack" target:self action:@selector(leftBarButtonItemClick)];
    [self.navigationController pushViewController:controller animated:YES];
    
}
- (void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSArray<NSString *> *)itemsTitle {
    if (_itemsTitle == nil) {
        _itemsTitle = @[@"UIView",
                        @"UIImage",
                        @"UILabel",
                        @"UIBarButtonItem"
                        ];
    }
    return _itemsTitle;
}
- (NSArray<NSArray *> *)itemsSubTitle {
    if (_itemsSubTitle == nil) {
        _itemsSubTitle = @[
                            @[@"UIView+YUFrame"
                             ],
                            @[@"UIImage+YUResize",
                              @"UIImage+YUCompress",
                              @"UIImage+YUCreateImage"
                              ],
                            @[@"UILabel+YUTextSize"
                              ],
                            @[@"UIBarButtonItem+YUCustom"
                              ]
                           ];
    }
    return _itemsSubTitle;
}

@end