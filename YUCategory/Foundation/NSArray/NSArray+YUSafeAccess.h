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

@interface NSArray (YUSafeAccess)

/// 返回值为 nil 的情况
/// 1.数组越界
/// 2.返回的对象不是要取的类型

/**
 安全取数组中的对象
 @return 返回的 obj 可能是 nil/[NSNull null]
 */
- (id)yu_objectAtIndex:(NSUInteger)index;

/**
 安全取数组中的数组
 @return 返回的 obj 可能是 nil/@[]
 */
- (NSArray *)yu_arrayAtIndex:(NSUInteger)index;

/**
 安全取数组中的字典
 @return 返回的 obj 可能是 nil/@{}
 */
- (NSDictionary *)yu_dictionaryAtIndex:(NSUInteger)index;

/**
 安全取数组中的字符串
 @return 返回的 obj 可能是 nil/@""
 */
- (NSString *)yu_stringAtIndex:(NSUInteger)index;

/**
 安全取数组中的 Number
 @return 返回的 obj 可能是 nil
 */
- (NSNumber *)yu_numberAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray(YUSafeAccess)

/// - (void)addObject:(ObjectType)anObject;
/// - (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;
/// - (void)removeObjectAtIndex:(NSUInteger)index;
/// - (void)replaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;

/// 返回值为 NO 的情况有
/// 1. anObject == nil
/// 2. index 数组越界

/// 参数 anObject 可以为 [NSNull null]

- (BOOL)yu_addObject:(id)anObject;

- (BOOL)yu_insertObject:(id)anObject atIndex:(NSUInteger)index;

- (BOOL)yu_removeObjectAtIndex:(NSUInteger)index;

- (BOOL)yu_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end
