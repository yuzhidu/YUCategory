//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  NSDictionary 中的 key 和 value 必须都是对象.
//  在iOS中, 只要是不为 nil 的 OC 不可变对象类型, 都可以作为 NSDictionary<KeyType, ObjectType> 的 KeyType.
//  比如 NSNumber, NSArray, NSMutableArray, NSDictionary, 甚至 NSNull 等等
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YUSafeAccess)

#pragma mark - KeyType 为 字符串类型 不可变对象

/**
 字典的 key 是否存在, 如果字典的 keyType 不是字符串,则返回 NO.
 Apple 建议使用 NSSting 类型作为字典的 keyType(键类型), 通常我们也是这样做的.
 */
- (BOOL)yu_hasKey:(NSString *)key;

/**
 取出字典中的对象, 用于自定义对象类型 NSData NSObject
 返回 nil 的情况:
 1. key 不存在
 2. value 不存在
 3. value 为 NSNull 类型
 */
- (id)yu_objForKey:(id)key;

/**
 取出字典中的字典对象
 返回 nil 的情况:
 1. key 不存在
 2. value 不存在
 3. value 为 NSNull 类型
 4. value 为 非 NSDictionary 类型
 */
- (NSDictionary *)yu_dictionaryForKey:(NSString *)key;

/**
 取出字典中的数组对象
 返回 nil 的情况:
 1. key 不存在
 2. value 不存在
 3. value 为 NSNull 类型
 4. value 为 非 NSArray 类型
 */
- (NSArray *)yu_arrayForKey:(NSString *)key;

/**
 取出字典中的字符串, nil/NSString
 返回 nil 的情况:
 1. key 不存在
 2. value 不存在
 3. value 为 NSNull 类型
 4. value 为 非 NSString 或非 NSNumber 类型
 */
- (NSString *)yu_stringForKey:(NSString *)key;

/**
 取出字典中的布尔值
 
 返回 NO 的情况:
 1. key 不存在
 2. value 不存在
 3. value 为 NSNull 类型
 4. value 为 非 NSString 或非 NSNumber 类型
 5. value 为 NSString 类型, 且字符串内容为 @"NO" @"no" @"0" @"false" @"FALSE"
 6. value 为 NSString 类型, 内容为字母和(或)其它字符组合, 即非纯数字集合,
    例如 @"a" @"jack" @"o2o"
 7.value 为 NSNumber 类型, 且值为0
 
 返回 YES 的情况:
 1.value 为字符串 @"yes" @"YES" @"true" @"TRUE"
 2.value 为由纯数字组成的字符串 @"1" @"123" @"2019"
 3.value 为 NSNumber 类型, 且值为非0
 */
- (BOOL)yu_boolForKey:(NSString *)key;

/**
 取出字典中的 NSNumber 对象, 推荐使用 NSNumber 取数字.
 返回 nil 的情况:
 1. key 不存在
 2. value 不存在
 3. value 为 NSNull 类型
 4. value 为 非 NSNumber 类型
 */
- (NSNumber *)yu_numberForKey:(NSString *)key;

#pragma mark - KeyType 为 任意类型 不可变对象(不推荐,一般不用非字符串对象作为字典的键)

/**
 字典的 key 是否存在
 不推荐:字典的 keyType 可能是任意类型的对象.
 */
- (BOOL)yu_hasKeyOfUnlimitedType:(id)key;

- (id)yu_objForKeyOfUnlimitedType:(id)key;

- (NSDictionary *)yu_dictionaryForKeyOfUnlimitedType:(id)key;

- (NSArray *)yu_arrayForKeyOfUnlimitedType:(id)key;

- (NSString *)yu_stringForKeyOfUnlimitedType:(id)key;

- (BOOL)yu_boolForKeyOfUnlimitedType:(id)key;

- (NSNumber *)yu_numberForKeyOfUnlimitedType:(id)key;

@end

@interface NSMutableDictionary(YUSafeAccess)

/// key 必须为字符串, 且字符串长度 > 0
/// 不允许无意义的字符串作为key, 例如 @""

#pragma mark - set / add

/// value 不为 nil, 不为 Null
/// 注意: 如果字典中无 key 对应的对象, 会新增此 key和value

- (BOOL)yu_setObj:(id)obj forKey:(NSString *)key;

- (BOOL)yu_setDictionary:(NSDictionary *)dict forKey:(NSString *)key;

- (BOOL)yu_setArray:(NSArray *)array forKey:(NSString *)key;

- (BOOL)yu_setString:(NSString *)string forKey:(NSString *)key;

- (BOOL)yu_setNumber:(NSNumber *)number forKey:(NSString *)key;

#pragma mark - remove

- (BOOL)yu_removeObjectForKey:(NSString *)key;

@end
