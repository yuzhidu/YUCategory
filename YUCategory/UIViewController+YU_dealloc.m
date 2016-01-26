//
//  UIViewController+YU_dealloc.h
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//  使用环境:MRC
//  Version:1.1

#import "UIViewController+YU_dealloc.h"
#import <objc/runtime.h>

#ifdef DEBUG
#define YULog(...)  NSLog(__VA_ARGS__)
#else
#define YULog(...)
#endif

@implementation UIViewController (YU_dealloc)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        // 1. dealloc
        SEL originalDeallocSelector = @selector(dealloc);
        SEL swizzledDeallocSelector = @selector(yu_dealloc);
        
        Method originalDeallocMethod = class_getInstanceMethod(class, originalDeallocSelector);
        Method swizzledDeallocMethod = class_getInstanceMethod(class, swizzledDeallocSelector);
        
        BOOL didAddDeallocMethod =
        class_addMethod(class,
                        originalDeallocSelector,
                        method_getImplementation(swizzledDeallocMethod),
                        method_getTypeEncoding(swizzledDeallocMethod));
        
        if (didAddDeallocMethod) {
            class_replaceMethod(class,
                                swizzledDeallocSelector,
                                method_getImplementation(originalDeallocMethod),
                                method_getTypeEncoding(originalDeallocMethod));
        } else {
            method_exchangeImplementations(originalDeallocMethod, swizzledDeallocMethod);
        }
        
        // 2. didReceiveMemoryWarning
        SEL originalRMWSelector = @selector(didReceiveMemoryWarning);
        SEL swizzledRMWSelector = @selector(yu_didReceiveMemoryWarning);
        
        Method originalRMWMethod = class_getInstanceMethod(class, originalRMWSelector);
        Method swizzledRMWMethod = class_getInstanceMethod(class, swizzledRMWSelector);
        
        BOOL didAddRMWMethod =
        class_addMethod(class,
                        originalRMWSelector,
                        method_getImplementation(swizzledRMWMethod),
                        method_getTypeEncoding(swizzledRMWMethod));
        
        if (didAddRMWMethod) {
            class_replaceMethod(class,
                                swizzledRMWSelector,
                                method_getImplementation(originalRMWMethod),
                                method_getTypeEncoding(originalRMWMethod));
        } else {
            method_exchangeImplementations(originalRMWMethod, swizzledRMWMethod);
        }
    });
}

- (void)yu_dealloc {
    YULog(@"dealloc --> %@", NSStringFromClass([self class]));
    [self yu_dealloc];
}

- (void)yu_didReceiveMemoryWarning {
    YULog(@"didReceiveMemoryWarning --> %@", NSStringFromClass([self class]));
    [self yu_didReceiveMemoryWarning];
}

@end
