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
        default:
            break;
    }
}
- (void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
