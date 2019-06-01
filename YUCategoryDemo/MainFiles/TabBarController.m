//
//  TabBarController.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/2/14.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "TabBarController.h"
#import "NavController.h"

#import "UIKitController.h"
#import "FoundationController.h"

@interface TabBarController ()

@end

@implementation TabBarController

+ (void)initialize {
    [self setupTabBarTheme];
}
/** 设置选项卡的主题 */
+ (void)setupTabBarTheme {
    
//    [[UITabBar appearance] setBarTintColor:[UIColor redColor]];
    [[UITabBar appearance] setTranslucent:YES];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage yu_createImageWithColor:mColorWithRGB(233, 233, 233)]];
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = mColorWithRGB(102, 102, 102);
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = mColorTheme;
    
    // 设置文字属性
    [[UITabBarItem appearance] setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // 设置底部栏(创建控制器)
        [self setupChildViews];
    }
    return self;
}
- (void)setupChildViews {
    UIKitController *kitVC = [[UIKitController alloc] init];
    FoundationController *foundationVC = [[FoundationController alloc] init];
    [self addOneChildController:foundationVC
                          title:@"Foundation"
                       norImage:@"tabBar_foundation_normal"
                  selectedImage:@"tabBar_foundation_selected"];
    [self addOneChildController:kitVC
                          title:@"UIKit"
                       norImage:@"tabBar_UIKit_normal"
                  selectedImage:@"tabBar_UIKit_selected"];
}
- (void)addOneChildController:(UIViewController *)childVC
                        title:(NSString *)title
                     norImage:(NSString *)norImage
                selectedImage:(NSString *)selectedImage {
    
    // 设置选项卡控制器的属性
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [[UIImage imageNamed:norImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NavController *navVC = [[NavController alloc] initWithRootViewController:childVC];
    [self addChildViewController:navVC];
}

@end
