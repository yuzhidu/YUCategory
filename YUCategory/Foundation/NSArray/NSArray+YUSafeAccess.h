//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  安全访问数组 （可变/不可变）
//  有时取出数组中的值时不能确定是否合法，就需要我们来处理不合法的情况
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (YUSafeAccess)
/**
 取出数组中的 对象
 
 @param index 索引
 @return nil/对象
 */
- (id)yu_objectAtIndex:(NSUInteger)index;

/**
 取出数组中的 字符串
 
 @param index 索引
 @return nil/NSString
 */
- (NSString *)yu_stringAtIndex:(NSUInteger)index;

/**
 取出数组中的 NSNumber
 
 @param index 索引
 @return nil/NSNumber
 */
- (NSNumber *)yu_numberAtIndex:(NSUInteger)index;

/**
 取出数组中的 十进制数 NSDecimalNumber
 
 @param index 索引
 @return nil/NSDecimalNumber
 */
- (NSDecimalNumber *)yu_decimalNumberAtIndex:(NSUInteger)index;

/**
 取出数组中的 数组
 
 @param index 索引
 @return nil/NSArray
 */
- (NSArray *)yu_arrayAtIndex:(NSUInteger)index;

/**
 取出数组中的 字典
 
 @param index 索引
 @return nil/NSDictionary
 */
- (NSDictionary *)yu_dictionaryAtIndex:(NSUInteger)index;

/**
 取出数组中的 整数
 
 @param index 索引
 @return 0/NSInteger
 */
- (NSInteger)yu_integerAtIndex:(NSUInteger)index;

/**
 取出数组中的 无符号整数
 
 @param index 索引
 @return 0/NSUInteger
 */
- (NSUInteger)yu_unsignedIntegerAtIndex:(NSUInteger)index;

/**
 取出数组中的 int16_t值
 
 @param index 索引
 @return 0/int16_t值
 */
- (int16_t)yu_int16AtIndex:(NSUInteger)index;

/**
 取出数组中的 int32_t值
 
 @param index 索引
 @return 0/int32_t值
 */
- (int32_t)yu_int32AtIndex:(NSUInteger)index;

/**
 取出数组中的 int64_t值
 
 @param index 索引
 @return 0/int64_t值
 */
- (int64_t)yu_int64AtIndex:(NSUInteger)index;

/**
 取出数组中的 char值
 
 @param index 索引
 @return 0/char值
 */
- (char)yu_charAtIndex:(NSUInteger)index;

/**
 取出数组中的 short值
 
 @param index 索引
 @return 0/short值
 */
- (short)yu_shortAtIndex:(NSUInteger)index;

/**
 取出数组中的 float值
 
 @param index 索引
 @return 0/float值
 */
- (float)yu_floatAtIndex:(NSUInteger)index;

/**
 取出数组中的 double值
 
 @param index 索引
 @return 0/double值
 */
- (double)yu_doubleAtIndex:(NSUInteger)index;

/**
 取出数组中的 NSDate值
 
 @param index 索引
 @param dateFormat 日期格式
 @return nil/NSDate
 */
- (NSDate *)yu_dateAtIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;

/**
 取出数组中的 CGFloat值
 
 @param index 索引
 @return 0/CGFloat
 */
- (CGFloat)yu_CGFloatAtIndex:(NSUInteger)index;

/**
 取出数组中的 CGPoint值
 
 @param index 索引
 @return CGPointZero/CGPoint
 */
- (CGPoint)yu_pointAtIndex:(NSUInteger)index;

/**
 取出数组中的 CGSize值
 
 @param index 索引
 @return CGSizeZero/CGSize
 */
- (CGSize)yu_sizeAtIndex:(NSUInteger)index;

/**
 取出数组中的 CGRect值
 
 @param index 索引
 @return CGRectNull/CGRect
 */
- (CGRect)yu_rectAtIndex:(NSUInteger)index;
@end

#pragma mark - NSMutableArray setter
@interface NSMutableArray(YUSafeAccess)

- (void)yu_addObj:(id)obj;
- (void)yu_addString:(NSString *)string;
- (void)yu_addBool:(BOOL)bo;
- (void)yu_addInt:(int)i;
- (void)yu_addInteger:(NSInteger)i;
- (void)yu_addUnsignedInteger:(NSUInteger)i;
- (void)yu_addCGFloat:(CGFloat)f;
- (void)yu_addChar:(char)c;
- (void)yu_addFloat:(float)i;
- (void)yu_addPoint:(CGPoint)point;
- (void)yu_addSize:(CGSize)size;
- (void)yu_addRect:(CGRect)rect;

@end
