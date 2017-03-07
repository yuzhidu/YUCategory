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

/**
 取出数组中的 对象

 @param index 索引
 @return nil/对象
 */
- (id)yu_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return self[index];
    } else {
        return nil;
    }
}

/**
 取出数组中的 字符串

 @param index 索引
 @return nil/NSString
 */
- (NSString *)yu_stringAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"]) {
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
 取出数组中的 NSNumber
 
 @param index 索引
 @return nil/NSNumber
 */
- (NSNumber *)yu_numberAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
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
 取出数组中的 十进制数 NSDecimalNumber

 @param index 索引
 @return nil/NSDecimalNumber
 */
- (NSDecimalNumber *)yu_decimalNumberAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

/**
 取出数组中的 数组
 
 @param index 索引
 @return nil/NSArray
 */
- (NSArray *)yu_arrayAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"]) {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
}

/**
 取出数组中的 字典
 
 @param index 索引
 @return nil/NSDictionary
 */
- (NSDictionary *)yu_dictionaryAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"]) {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

/**
 取出数组中的 整数
 
 @param index 索引
 @return 0/NSInteger
 */
- (NSInteger)yu_integerAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return 0;
}

/**
 取出数组中的 无符号整数
 
 @param index 索引
 @return 0/NSUInteger
 */
- (NSUInteger)yu_unsignedIntegerAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

/**
 取出数组中的 bool值
 
 @param index 索引
 @return BOOL
 */
- (BOOL)yu_boolAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    return nil;
}

/**
 取出数组中的 int16_t值
 
 @param index 索引
 @return 0/int16_t值
 */
- (int16_t)yu_int16AtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
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
 取出数组中的 int32_t值
 
 @param index 索引
 @return 0/int32_t值
 */
- (int32_t)yu_int32AtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

/**
 取出数组中的 int64_t值
 
 @param index 索引
 @return 0/int64_t值
 */
- (int64_t)yu_int64AtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longLongValue];
    }
    return 0;
}

/**
 取出数组中的 char值
 
 @param index 索引
 @return 0/char值
 */
- (char)yu_charAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value charValue];
    }
    return 0;
}

/**
 取出数组中的 short值
 
 @param index 索引
 @return 0/short值
 */
- (short)yu_shortAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
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
 取出数组中的 float值
 
 @param index 索引
 @return 0/float值
 */
- (float)yu_floatAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

/**
 取出数组中的 double值
 
 @param index 索引
 @return 0/double值
 */
- (double)yu_doubleAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }
    return 0;
}

/**
 取出数组中的 NSDate值

 @param index 索引
 @param dateFormat 日期格式
 @return nil/NSDate
 */
- (NSDate *)yu_dateAtIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

/**
 取出数组中的 CGFloat值

 @param index 索引
 @return 0/CGFloat
 */
- (CGFloat)yu_CGFloatAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }
    return 0;
}

/**
 取出数组中的 CGPoint值
 
 @param index 索引
 @return CGPointZero/CGPoint
 */
- (CGPoint)yu_pointAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if ([value isKindOfClass:[NSString class]]) {
        return CGPointFromString(value);
    }
    return CGPointZero;
}

/**
 取出数组中的 CGSize值
 
 @param index 索引
 @return CGSizeZero/CGSize
 */
- (CGSize)yu_sizeAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if ([value isKindOfClass:[NSString class]]) {
        return CGSizeFromString(value);
    }
    return CGSizeZero;
}

/**
 取出数组中的 CGRect值
 
 @param index 索引
 @return CGRectNull/CGRect
 */
- (CGRect)yu_rectAtIndex:(NSUInteger)index {
    id value = [self yu_objectAtIndex:index];
    if ([value isKindOfClass:[NSString class]]) {
        return CGRectFromString(value);
    }
    return CGRectNull;
}
@end


#pragma mark - NSMutableArray setter
@implementation NSMutableArray (YUSafeAccess)

- (void)yu_addObj:(id)obj {
    if (obj != nil) {
        [self addObject:obj];
    }
}
- (void)yu_addString:(NSString *)string {
    if (string != nil) {
        [self addObject:string];
    }
}
- (void)yu_addBool:(BOOL)bo {
    [self addObject:@(bo)];
}
- (void)yu_addInt:(int)i {
    [self addObject:@(i)];
}
- (void)yu_addInteger:(NSInteger)i {
    [self addObject:@(i)];
}
- (void)yu_addUnsignedInteger:(NSUInteger)i {
    [self addObject:@(i)];
}
- (void)yu_addCGFloat:(CGFloat)f {
    [self addObject:@(f)];
}
- (void)yu_addChar:(char)c {
    [self addObject:@(c)];
}
- (void)yu_addFloat:(float)i {
    [self addObject:@(i)];
}
- (void)yu_addPoint:(CGPoint)point {
    [self addObject:NSStringFromCGPoint(point)];
}
- (void)yu_addSize:(CGSize)size {
    [self addObject:NSStringFromCGSize(size)];
}
- (void)yu_addRect:(CGRect)rect {
    [self addObject:NSStringFromCGRect(rect)];
}
@end
