//
//  NSString+YUSafeAccess.m
//  Pods-YUCategoryDemo
//
//  Created by mayubo on 2019/6/17.
//

#import "NSString+YUSafeAccess.h"

@implementation NSString (YUSafeAccess)

- (NSString *)yu_safeStringMaybeEmpty {
    if ([self isKindOfClass:[NSString class]]) {
        if (self.length > 0) {
            return self;
        }
    }
    return @"";
}

- (NSString *)yu_safeStringMaybeNil {
    if ([self isKindOfClass:[NSString class]]) {
        if (self.length > 0) {
            return self;
        }
    }
    return nil;
}

@end
