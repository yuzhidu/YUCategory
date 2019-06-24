//
//  NSString+YUSafeAccess.h
//  Pods-YUCategoryDemo
//
//  Created by mayubo on 2019/6/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YUSafeAccess)

/**
 以下情况，返回 @""
 1. self.length == 0
 2. self == nil
 3. self 为非 NSString 类型
 */
- (NSString *)yu_safeStringMaybeEmpty;

/**
 以下情况，返回 nil
 1. self.length == 0
 2. self == nil
 3. self 为非 NSString 类型
 */
- (NSString *)yu_safeStringMaybeNil;

@end

NS_ASSUME_NONNULL_END
