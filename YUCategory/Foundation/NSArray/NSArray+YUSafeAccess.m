//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  安全访问数组 （可变/不可变）
//

#import "NSArray+YUSafeAccess.h"

@implementation NSArray (YUSafeAccess)

- (id)yu_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        id obj = [self objectAtIndex:index];
        if (obj) {
            return obj; // 此处obj可能是 [NSNull null]
        }
    }
    return nil;
}

- (NSArray *)yu_arrayAtIndex:(NSUInteger)index {
    id obj = [self yu_objectAtIndex:index];
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *)obj; // 此处obj可能是空数组 @[]
    }
    return nil;
}

- (NSDictionary *)yu_dictionaryAtIndex:(NSUInteger)index {
    id obj = [self yu_objectAtIndex:index];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj; // 此处obj可能是空字典 @{}
    }
    return nil;
}

- (NSString *)yu_stringAtIndex:(NSUInteger)index {
    id obj = [self yu_objectAtIndex:index];
    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString *)obj; // 此处obj可能是空字符串 @""
    }
    return nil;
}

- (NSNumber *)yu_numberAtIndex:(NSUInteger)index {
    id obj = [self yu_objectAtIndex:index];
    if ([obj isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)obj;
    }
    return nil;
}

@end

@implementation NSMutableArray (YUSafeAccess)

- (BOOL)yu_addObject:(id)anObject {
    if (anObject == nil) {
        return NO;
    }
    [self addObject:anObject];
    return YES;
}

- (BOOL)yu_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        return NO;
    }
    if (index > self.count) {
        return NO;
    }
    [self insertObject:anObject atIndex:index];
    return YES;
}

- (BOOL)yu_removeObjectAtIndex:(NSUInteger)index {
    if (index > self.count) {
        return NO;
    }
    [self removeObjectAtIndex:index];
    return YES;
}

- (BOOL)yu_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (anObject == nil) {
        return NO;
    }
    if (index > self.count) {
        return NO;
    }
    [self replaceObjectAtIndex:index withObject:anObject];
    return YES;
}

@end
