//
//  MainNavController.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/2/14.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "NavController.h"

@interface NavController ()

@end

@implementation NavController

+ (void)initialize {
    [self setupNavTheme];
}
/** 设置导航条的主题 */
+ (void)setupNavTheme {
    
    // 1.设置 UINavigationBar 的主题
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"themeColor"]
                 forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSForegroundColorAttributeName] = [UIColor whiteColor];
    md[NSFontAttributeName] = [UIFont systemFontOfSize:17.f];
    [[UINavigationBar appearance] setTitleTextAttributes:md];
    
    // 2.设置 BarButtonItem 的主题
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16.f];
    [[UIBarButtonItem appearance] setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        // 不是栈底控制器，隐藏底部 TabBar（如果有）
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end
