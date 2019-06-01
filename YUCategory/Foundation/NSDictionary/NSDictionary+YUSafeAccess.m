//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  安全使用字典
//

#import "NSDictionary+YUSafeAccess.h"

@implementation NSDictionary (YUSafeAccess)

#pragma mark - KeyType 为 字符串类型 不可变对象

- (BOOL)yu_hasKey:(NSString *)key {
    if (![key isKindOfClass:[NSString class]]) {
        return NO;
    }
    return [self yu_hasKeyOfUnlimitedType:key];
}

- (id)yu_objForKey:(NSString *)key {
    if (![self yu_hasKey:key]) {
        return nil;
    }
    return [self yu_objForKeyCommonMethod:key];
}

- (NSDictionary *)yu_dictionaryForKey:(NSString *)key {
    if (![self yu_hasKey:key]) {
        return nil;
    }
    return [self yu_dictionaryForKeyCommonMethod:key];
}

- (NSArray *)yu_arrayForKey:(NSString *)key {
    if (![self yu_hasKey:key]) {
        return nil;
    }
    return [self yu_arrayForKeyCommonMethod:key];
}

- (NSString *)yu_stringForKey:(NSString *)key {
    if (![self yu_hasKey:key]) {
        return nil;
    }
    return [self yu_stringForKeyCommonMethod:key];
}

- (BOOL)yu_boolForKey:(NSString *)key {
    if (![self yu_hasKey:key]) {
        return NO;
    }
    return [self yu_boolForKeyCommonMethod:key];
}

- (NSNumber *)yu_numberForKey:(NSString *)key {
    if (![self yu_hasKey:key]) {
        return nil;
    }
    return [self yu_numberForKeyCommonMethod:key];
}

#pragma mark - KeyType 为 任意类型 不可变对象(不推荐,一般不用非字符串对象作为字典的键)

- (BOOL)yu_hasKeyOfUnlimitedType:(id)key {
    return [self.allKeys containsObject:key];
}

- (id)yu_objForKeyOfUnlimitedType:(id)key {
    if (![self yu_hasKeyOfUnlimitedType:key]) {
        return nil;
    }
    return [self yu_objForKeyCommonMethod:key];
}

- (NSDictionary *)yu_dictionaryForKeyOfUnlimitedType:(id)key {
    if (![self yu_hasKeyOfUnlimitedType:key]) {
        return nil;
    }
    return [self yu_dictionaryForKeyCommonMethod:key];
}

- (NSArray *)yu_arrayForKeyOfUnlimitedType:(id)key {
    if (![self yu_hasKeyOfUnlimitedType:key]) {
        return nil;
    }
    return [self yu_arrayForKeyCommonMethod:key];
}

- (NSString *)yu_stringForKeyOfUnlimitedType:(id)key {
    if (![self yu_hasKeyOfUnlimitedType:key]) {
        return nil;
    }
    return [self yu_stringForKeyCommonMethod:key];
}

- (BOOL)yu_boolForKeyOfUnlimitedType:(id)key {
    if (![self yu_hasKeyOfUnlimitedType:key]) {
        return NO;
    }
    return [self yu_boolForKeyCommonMethod:key];
}

- (NSNumber *)yu_numberForKeyOfUnlimitedType:(id)key {
    if (![self yu_hasKeyOfUnlimitedType:key]) {
        return nil;
    }
    return [self yu_numberForKeyCommonMethod:key];
}

#pragma mark - Private Common Method

- (id)yu_objForKeyCommonMethod:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    return value;
}

- (NSDictionary *)yu_dictionaryForKeyCommonMethod:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)value;
    }
    return nil;
}

- (NSArray *)yu_arrayForKeyCommonMethod:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]]) {
        return (NSArray *)value;
    }
    return nil;
}

- (NSString *)yu_stringForKeyCommonMethod:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString *)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    return nil;
}

- (BOOL)yu_boolForKeyCommonMethod:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    return NO;
}

- (NSNumber *)yu_numberForKeyCommonMethod:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)value;
    }
    return nil;
}

@end

@implementation NSMutableDictionary (YUSafeAccess)

#pragma mark - set / add

- (BOOL)yu_setObj:(id)obj forKey:(NSString *)key {
    if ([self keyIsAvailable:key]) {
        return NO;
    }
    if (obj == nil) {
        return NO;
    }
    if ([obj isKindOfClass:[NSNull class]]) {
        return NO;
    }
    [self setObject:obj forKey:key];
    return YES;
}

- (BOOL)yu_setDictionary:(NSDictionary *)dict forKey:(NSString *)key {
    if ([self keyIsAvailable:key]) {
        return NO;
    }
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    [self setObject:dict forKey:key];
    return YES;
}

- (BOOL)yu_setArray:(NSArray *)array forKey:(NSString *)key {
    if ([self keyIsAvailable:key]) {
        return NO;
    }
    if (![array isKindOfClass:[NSArray class]]) {
        return NO;
    }
    [self setObject:array forKey:key];
    return YES;
}

- (BOOL)yu_setString:(NSString *)string forKey:(NSString *)key {
    if ([self keyIsAvailable:key]) {
        return NO;
    }
    if (![string isKindOfClass:[NSString class]]) {
        return NO;
    }
    [self setObject:string forKey:key];
    return YES;
}

- (BOOL)yu_setNumber:(NSNumber *)number forKey:(NSString *)key {
    if ([self keyIsAvailable:key]) {
        return NO;
    }
    if (![number isKindOfClass:[NSNumber class]]) {
        return NO;
    }
    [self setObject:number forKey:key];
    return YES;
}

#pragma mark - remove

- (BOOL)yu_removeObjectForKey:(NSString *)key {
    if ([self keyIsAvailable:key]) {
        return NO;
    }
    [self removeObjectForKey:key];
    return YES;
}

#pragma mark - check key

/**
 key 必须为字符串, 且字符串长度 > 0,
 不允许无意义的字符串作为key, 例如 @""
 */
- (BOOL)keyIsAvailable:(NSString *)key {
    if (key == nil) {
        return NO;
    }
    if (![key isKindOfClass:[NSString class]]) {
        return NO;
    }
    if (key.length == 0) {
        return NO;
    }
    return NO;
}

@end
