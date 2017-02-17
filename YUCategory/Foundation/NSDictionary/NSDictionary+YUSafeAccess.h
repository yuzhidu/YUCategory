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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (YUSafeAccess)

/**
 字典是否有key
 */
- (BOOL)yu_hasKey:(NSString *)key;

/**
 根据key取出字典中的 string
 
 @return nil/NSString
 */
- (NSString *)yu_stringForKey:(id)key;

/**
 根据key取出字典中的 NSNumber
 
 @return nil/NSNumber
 */
- (NSNumber *)yu_numberForKey:(id)key;

/**
 根据key取出字典中的 十进制NSNumber
 
 @return nil/NSDecimalNumber
 */
- (NSDecimalNumber *)yu_decimalNumberForKey:(id)key;

/**
 根据key取出字典中的 NSArray
 
 @return nil/NSArray
 */
- (NSArray *)yu_arrayForKey:(id)key;

/**
 根据key取出字典中的 NSDictionary
 
 @return nil/NSDictionary
 */
- (NSDictionary *)yu_dictionaryForKey:(id)key;

/**
 根据key取出字典中的 NSInteger
 
 @return 0/NSInteger
 */
- (NSInteger)yu_integerForKey:(id)key;

/**
 根据key取出字典中的 NSUInteger
 
 @return 0/NSUInteger
 */
- (NSUInteger)yu_unsignedIntegerForKey:(id)key;

/**
 根据key取出字典中的 BOOL
 
 @return BOOL
 */
- (BOOL)yu_boolForKey:(id)key;

/**
 根据key取出字典中的 int16_t
 
 @return 0/int16_t
 */
- (int16_t)yu_int16ForKey:(id)key;

/**
 根据key取出字典中的 int32_t
 
 @return 0/int32_t
 */
- (int32_t)yu_int32ForKey:(id)key;

/**
 根据key取出字典中的 int64_t
 
 @return 0/int64_t
 */
- (int64_t)yu_int64ForKey:(id)key;

/**
 根据key取出字典中的 char
 
 @return 0/char
 */
- (char)yu_charForKey:(id)key;

/**
 根据key取出字典中的 short
 
 @return 0/short
 */
- (short)yu_shortForKey:(id)key;

/**
 根据key取出字典中的 float
 
 @return 0/float
 */
- (float)yu_floatForKey:(id)key;

/**
 根据key取出字典中的 double
 
 @return 0/double
 */
- (double)yu_doubleForKey:(id)key;

/**
 根据key取出字典中的 long long
 
 @return 0/long long
 */
- (long long)yu_longLongForKey:(id)key;

/**
 根据key取出字典中的 unsigned long long
 
 @return 0/unsigned long long
 */
- (unsigned long long)yu_unsignedLongLongForKey:(id)key;

/**
 根据key取出字典中的 NSDate
 
 @param dateFormat 日期格式
 @return nil/NSDate
 */
- (NSDate *)yu_dateForKey:(id)key
               dateFormat:(NSString *)dateFormat;

/**
 根据key取出字典中的 CGFloat
 
 @return CGFloat
 */
- (CGFloat)yu_CGFloatForKey:(id)key;

/**
 根据key取出字典中的 CGFloat
 
 @return CGFloat
 */
- (CGPoint)yu_pointForKey:(id)key;

/**
 根据key取出字典中的 CGSize
 
 @return CGSize
 */
- (CGSize)yu_sizeForKey:(id)key;

/**
 根据key取出字典中的 CGRect
 
 @return CGRect
 */
- (CGRect)yu_rectForKey:(id)key;
@end


#pragma mark - NSMutableDictionary setter

@interface NSMutableDictionary(YUSafeAccess)

- (void)yu_setObj:(id)obj forKey:(NSString *)key;
- (void)yu_setString:(NSString *)string forKey:(NSString *)key;
- (void)yu_setBool:(BOOL)i forKey:(NSString *)key;
- (void)yu_setInt:(int)i forKey:(NSString *)key;
- (void)yu_setInteger:(NSInteger)i forKey:(NSString *)key;
- (void)yu_setUnsignedInteger:(NSUInteger)i forKey:(NSString *)key;
- (void)yu_setCGFloat:(CGFloat)f forKey:(NSString *)key;
- (void)yu_setChar:(char)c forKey:(NSString *)key;
- (void)yu_setFloat:(float)i forKey:(NSString *)key;
- (void)yu_setDouble:(double)i forKey:(NSString *)key;
- (void)yu_setLongLong:(long long)i forKey:(NSString *)key;
- (void)yu_setPoint:(CGPoint)o forKey:(NSString *)key;
- (void)yu_setSize:(CGSize)o forKey:(NSString *)key;
- (void)yu_setRect:(CGRect)o forKey:(NSString *)key;

@end
