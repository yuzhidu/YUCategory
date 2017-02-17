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

/**
 字典是否有key
 */
- (BOOL)yu_hasKey:(NSString *)key {
    return [self objectForKey:key] != nil;
}

/**
 根据key取出字典中的 string
 
 @return nil/NSString
 */
- (NSString *)yu_stringForKey:(id)key {
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

/**
 根据key取出字典中的 NSNumber
 
 @return nil/NSNumber
 */
- (NSNumber *)yu_numberForKey:(id)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString *)value];
    }
    return nil;
}

/**
 根据key取出字典中的 十进制NSNumber
 
 @return nil/NSDecimalNumber
 */
- (NSDecimalNumber *)yu_decimalNumberForKey:(id)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

/**
 根据key取出字典中的 NSArray
 
 @return nil/NSArray
 */
- (NSArray *)yu_arrayForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
}

/**
 根据key取出字典中的 NSDictionary
 
 @return nil/NSDictionary
 */
- (NSDictionary *)yu_dictionaryForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

/**
 根据key取出字典中的 NSInteger
 
 @return 0/NSInteger
 */
- (NSInteger)yu_integerForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return 0;
}

/**
 根据key取出字典中的 NSUInteger
 
 @return 0/NSUInteger
 */
- (NSUInteger)yu_unsignedIntegerForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

/**
 根据key取出字典中的 BOOL
 
 @return BOOL
 */
- (BOOL)yu_boolForKey:(id)key {
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

/**
 根据key取出字典中的 int16_t
 
 @return 0/int16_t
 */
- (int16_t)yu_int16ForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

/**
 根据key取出字典中的 int32_t
 
 @return 0/int32_t
 */
- (int32_t)yu_int32ForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

/**
 根据key取出字典中的 int64_t
 
 @return 0/int64_t
 */
- (int64_t)yu_int64ForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longLongValue];
    }
    return 0;
}

/**
 根据key取出字典中的 char
 
 @return 0/char
 */
- (char)yu_charForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

/**
 根据key取出字典中的 short
 
 @return 0/short
 */
- (short)yu_shortForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

/**
 根据key取出字典中的 float
 
 @return 0/float
 */
- (float)yu_floatForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

/**
 根据key取出字典中的 double
 
 @return 0/double
 */
- (double)yu_doubleForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }
    return 0;
}

/**
 根据key取出字典中的 long long
 
 @return 0/long long
 */
- (long long)yu_longLongForKey:(id)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
    return 0;
}

/**
 根据key取出字典中的 unsigned long long
 
 @return 0/unsigned long long
 */
- (unsigned long long)yu_unsignedLongLongForKey:(id)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
        return [value unsignedLongLongValue];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
    return 0;
}

/**
 根据key取出字典中的 NSDate
 
 @param dateFormat 日期格式
 @return nil/NSDate
 */
- (NSDate *)yu_dateForKey:(id)key
               dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

/**
 根据key取出字典中的 CGFloat
 
 @return CGFloat
 */
- (CGFloat)yu_CGFloatForKey:(id)key {
    CGFloat f = [self[key] doubleValue];
    return f;
}

/**
 根据key取出字典中的 CGFloat
 
 @return CGFloat
 */
- (CGPoint)yu_pointForKey:(id)key {
    CGPoint point = CGPointFromString(self[key]);
    return point;
}

/**
 根据key取出字典中的 CGSize
 
 @return CGSize
 */
- (CGSize)yu_sizeForKey:(id)key {
    CGSize size = CGSizeFromString(self[key]);
    return size;
}

/**
 根据key取出字典中的 CGRect
 
 @return CGRect
 */
- (CGRect)yu_rectForKey:(id)key {
    CGRect rect = CGRectFromString(self[key]);
    return rect;
}

@end


#pragma mark - NSMutableDictionary setter
@implementation NSMutableDictionary (YUSafeAccess)

- (void)yu_setObj:(id)obj forKey:(NSString *)key {
    if (obj != nil) {
        self[key] = obj;
    }
}
- (void)yu_setString:(NSString *)string forKey:(NSString *)key {
    if (string != nil) {
        [self setValue:string forKey:key];
    }
}
- (void)yu_setBool:(BOOL)i forKey:(NSString *)key {
    self[key] = @(i);
}
- (void)yu_setInt:(int)i forKey:(NSString *)key {
    self[key] = @(i);
}
- (void)yu_setInteger:(NSInteger)i forKey:(NSString *)key {
    self[key] = @(i);
}
- (void)yu_setUnsignedInteger:(NSUInteger)i forKey:(NSString *)key {
    self[key] = @(i);
}
- (void)yu_setCGFloat:(CGFloat)f forKey:(NSString *)key {
    self[key] = @(f);
}
- (void)yu_setChar:(char)c forKey:(NSString *)key {
    self[key] = @(c);
}
- (void)yu_setFloat:(float)i forKey:(NSString *)key {
    self[key] = @(i);
}
- (void)yu_setDouble:(double)i forKey:(NSString *)key {
    self[key] = @(i);
}
- (void)yu_setLongLong:(long long)i forKey:(NSString *)key {
    self[key] = @(i);
}
- (void)yu_setPoint:(CGPoint)o forKey:(NSString *)key {
    self[key] = NSStringFromCGPoint(o);
}
- (void)yu_setSize:(CGSize)o forKey:(NSString *)key {
    self[key] = NSStringFromCGSize(o);
}
- (void)yu_setRect:(CGRect)o forKey:(NSString *)key {
    self[key] = NSStringFromCGRect(o);
}

@end
