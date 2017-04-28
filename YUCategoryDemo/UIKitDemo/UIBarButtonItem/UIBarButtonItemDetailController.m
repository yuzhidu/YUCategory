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
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barButtonWithImage:@"arrowBack"
                                                                                     target:self
                                                                                     action:@selector(leftBarButtonItemClick)];
            
            self.navigationItem.rightBarButtonItems = [UIBarButtonItem yu_barButtonWithImage:@"share"
                                                                                      target:self
                                                                                      action:@selector(leftBarButtonItemClick)];
        }
            break;
        case 1:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barButtonWithImage:@"arrowBack"
                                                                                     target:self
                                                                                     action:@selector(leftBarButtonItemClick)
                                                                                     margin:-15];
        }
            break;
        case 2:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barButtonWithImage:@"arrowBack"
                                                                           highlightedImage:@"share"
                                                                                     target:self
                                                                                     action:@selector(leftBarButtonItemClick)
                                                                                     margin:3];
        }
            break;
        case 3:
        {
            self.navigationItem.leftBarButtonItems = [UIBarButtonItem yu_barButtonWithImage:@"arrowBack"
                                                                           highlightedImage:nil
                                                                                     target:self
                                                                                     action:@selector(leftBarButtonItemClick)
                                                                                     margin:12
                                                                                       size:CGSizeMake(30, 30)];
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
