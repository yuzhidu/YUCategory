//
//  UIBarButtonItemDetailController.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/4/28.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "UIBarButtonItemDetailController.h"

@interface UIBarButtonItemDetailController ()

@end

@implementation UIBarButtonItemDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupCurrentController];
}
- (void)setupCurrentController {
    
    switch (self.row) {
        case 0:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barWithImage:@"arrowBack"
                                                                               target:self
                                                                               action:@selector(leftBarButtonItemClick)
                                                                     highlightedImage:@"share"
                                                                               margin:15
                                                                                 size:CGSizeMake(30, 30)];
        }
            break;
        case 1:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barWithImage:@"arrowBack"
                                                                               target:self
                                                                               action:@selector(leftBarButtonItemClick)];
            
            self.navigationItem.rightBarButtonItems = [UIBarButtonItem yu_barWithImage:@"share"
                                                                                target:self
                                                                                action:@selector(leftBarButtonItemClick)];
        }
            break;
        case 2:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barWithImage:@"arrowBack"
                                                                               target:self
                                                                               action:@selector(leftBarButtonItemClick)
                                                                     highlightedImage:@"share"];
        }
            break;
        case 3:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barWithImage:@"arrowBack"
                                                                               target:self
                                                                               action:@selector(leftBarButtonItemClick)
                                                                               margin:3];
        }
            break;
        case 4:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barWithImage:@"arrowBack"
                                                                               target:self
                                                                               action:@selector(leftBarButtonItemClick)
                                                                     highlightedImage:@"share"
                                                                               margin:15];
        }
            break;
        case 5:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barWithImage:@"arrowBack"
                                                                               target:self
                                                                               action:@selector(leftBarButtonItemClick)];
            self.navigationItem.rightBarButtonItems = [UIBarButtonItem yu_barWithTitle:@"账单"
                                                                                target:self
                                                                                action:@selector(rightClick)
                                                                                 color:[UIColor whiteColor]
                                                                                  font:[UIFont systemFontOfSize:12.f]
                                                                                margin:-16
                                                                      highlightedTitle:@"金条"
                                                                      highlightedColor:[UIColor greenColor]
                                                                         textAlignment:NSTextAlignmentCenter
                                                                                  size:CGSizeMake(80, 30)];
        }
            break;
        case 6:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barWithImage:@"arrowBack"
                                                                               target:self
                                                                               action:@selector(leftBarButtonItemClick)];
            self.navigationItem.rightBarButtonItems = [UIBarButtonItem yu_barWithTitle:@"添加好友"
                                                                                target:self
                                                                                action:@selector(rightClick)
                                                                                 color:[UIColor whiteColor]
                                                                                  font:[UIFont systemFontOfSize:14.f]];
        }
            break;
        case 7:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barWithImage:@"arrowBack"
                                                                               target:self
                                                                               action:@selector(leftBarButtonItemClick)];
            self.navigationItem.rightBarButtonItems = [UIBarButtonItem yu_barWithTitle:@"取消"
                                                                                target:self
                                                                                action:@selector(rightClick)
                                                                                 color:[UIColor redColor]
                                                                                  font:[UIFont systemFontOfSize:16.f]
                                                                                margin:-16];
        }
            break;
        default:
            break;
    }
}

- (void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightClick {
    NSLog(@"右侧点击");
}
@end
