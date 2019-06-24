//
//  FoundationController.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/2/14.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "FoundationController.h"

@interface FoundationController ()
/** 标题 */
@property (nonatomic, strong) NSArray<NSString *> *itemsTitle;
@property (nonatomic, strong) NSArray<NSArray *> *itemsSubTitle;
@end

@implementation FoundationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = YU_ColorBackground;
    
    self.navigationItem.title = @"Foundation分类(按字母排序)";
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
    controller.view.backgroundColor = YU_ColorBackground;
    controller.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barWithImage:@"arrowBack"
                                                                             target:self
                                                                             action:@selector(leftBarButtonItemClick)];
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSArray<NSString *> *)itemsTitle {
    if (_itemsTitle == nil) {
        _itemsTitle = @[@"NSArray",
                        @"NSAttributedString",
                        @"NSDate",
                        @"NSDictionary",
                        @"NSObject",
                        @"NSString"
                        ];
    }
    return _itemsTitle;
}
- (NSArray<NSArray *> *)itemsSubTitle {
    if (_itemsSubTitle == nil) {
        _itemsSubTitle = @[
                           @[@"NSArray+YUFormatNSLog",
                             @"NSArray+YUSafeAccess",
                             @"NSArray+YUSerialization"],
                           
                           @[@"NSAttributedString+YUTextSize"],
                           
                           @[@"NSDate+YUFormat",
                             @"NSDate+YUJudge",
                             @"NSDate+YUOther"],
                           
                           @[@"NSDictionary+YUFormatNSLog",
                             @"NSDictionary+YUJSONString",
                             @"NSDictionary+YUSafeAccess"],
                           
                           @[@"NSObject+YUFileDelete"],
                           
                           @[@"NSString+YUAppendPath",
                             @"NSString+YUBase",
                             @"NSString+YUEmoji",
                             @"NSString+YUEmpty",
                             @"NSString+YUHash",
                             @"NSString+YUMatch",
                             @"NSString+YUOther",
                             @"NSString+YURegEx",
                             @"NSString+YUSerialization",
                             @"NSString+YUSize",
                             @"NSString+YUTimeFormat"]
                           ];
    }
    return _itemsSubTitle;
}

@end
