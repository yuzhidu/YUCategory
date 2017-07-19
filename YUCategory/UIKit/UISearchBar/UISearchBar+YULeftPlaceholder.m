//
//  UISearchBar+YULeftPlaceholder.m
//  YUCategoryDemo
//
//  Created by 马裕博 on 2017/7/19.
//  Copyright © 2017年 mayubo. All rights reserved.
//

#import "UISearchBar+YULeftPlaceholder.h"

@implementation UISearchBar (YULeftPlaceholder)

- (void)changeLeftPlaceholder:(NSString *)placeholder {
    self.placeholder = placeholder;
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector]) {
        BOOL centeredPlaceholder = NO;
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&centeredPlaceholder atIndex:2];
        [invocation invoke];
    }
}
@end
