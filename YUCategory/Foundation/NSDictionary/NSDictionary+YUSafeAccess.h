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

- (BOOL)yu_hasKey:(NSString *)key;

- (NSString *)yu_stringForKey:(id)key;

- (NSNumber *)yu_numberForKey:(id)key;

- (NSDecimalNumber *)yu_decimalNumberForKey:(id)key;

- (NSArray *)yu_arrayForKey:(id)key;

- (NSDictionary *)yu_dictionaryForKey:(id)key;

- (NSInteger)yu_integerForKey:(id)key;

- (NSUInteger)yu_unsignedIntegerForKey:(id)key;

- (BOOL)yu_boolForKey:(id)key;

- (int16_t)yu_int16ForKey:(id)key;

- (int32_t)yu_int32ForKey:(id)key;

- (int64_t)yu_int64ForKey:(id)key;

- (char)yu_charForKey:(id)key;

- (short)yu_shortForKey:(id)key;

- (float)yu_floatForKey:(id)key;

- (double)yu_doubleForKey:(id)key;

- (long long)yu_longLongForKey:(id)key;

- (unsigned long long)yu_unsignedLongLongForKey:(id)key;

- (NSDate *)yu_dateForKey:(id)key dateFormat:(NSString *)dateFormat;

//CG
- (CGFloat)yu_CGFloatForKey:(id)key;

- (CGPoint)yu_pointForKey:(id)key;

- (CGSize)yu_sizeForKey:(id)key;

- (CGRect)yu_rectForKey:(id)key;
@end


#pragma mark - NSMutableDictionary setter

@interface NSMutableDictionary(YUSafeAccess)

-(void)yu_setObj:(id)i forKey:(NSString*)key;

-(void)yu_setString:(NSString*)i forKey:(NSString*)key;

-(void)yu_setBool:(BOOL)i forKey:(NSString*)key;

-(void)yu_setInt:(int)i forKey:(NSString*)key;

-(void)yu_setInteger:(NSInteger)i forKey:(NSString*)key;

-(void)yu_setUnsignedInteger:(NSUInteger)i forKey:(NSString*)key;

-(void)yu_setCGFloat:(CGFloat)f forKey:(NSString*)key;

-(void)yu_setChar:(char)c forKey:(NSString*)key;

-(void)yu_setFloat:(float)i forKey:(NSString*)key;

-(void)yu_setDouble:(double)i forKey:(NSString*)key;

-(void)yu_setLongLong:(long long)i forKey:(NSString*)key;

-(void)yu_setPoint:(CGPoint)o forKey:(NSString*)key;

-(void)yu_setSize:(CGSize)o forKey:(NSString*)key;

-(void)yu_setRect:(CGRect)o forKey:(NSString*)key;
@end
