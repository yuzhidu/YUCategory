# YUCategory

使用时只需导入 YUCategory.h 头文件，包含了大部分常用的分类

支持 CocoaPods
```
pod 'YUCategory'
```

**注意：分类按字母排序，可根据字母快速找到对应分类**

目录:
1. Foundation
- [NSArray](#NSArray)
	- [NSArray+YUFormatNSLog](#NSArray+YUFormatNSLog)
	- [NSArray+YUSafeAccess](#NSArray+YUSafeAccess)
	- [NSArray+YUSerialization](#NSArray+YUSerialization)
- [NSAttributedString](#NSAttributedString)
	- [NSAttributedString+YUTextSize](#NSAttributedString+YUTextSize)
- [NSDate](#NSDate)
	- [NSDate+YUFormat](#NSDate+YUFormat)
	- [NSDate+YUJudge](#NSDate+YUJudge)
	- [NSDate+YUOther](#NSDate+YUOther)
- [NSDictionary](#NSDictionary)
	- [NSDictionary+YUFormatNSLog](#NSDictionary+YUFormatNSLog)
	- [NSDictionary+YUJSONString](#NSDictionary+YUJSONString)
	- [NSDictionary+YUSafeAccess](#NSDictionary+YUSafeAccess)
- [NSObject](#NSObject)
	- [NSObject+YUFileDelete](#NSObject+YUFileDelete)
- [NSString](#NSString)
	- [NSString+YUAppendPath](#NSString+YUAppendPath)
	- [NSString+YUBase](#NSString+YUBase)
	- [NSString+YUEmoji](#NSString+YUEmoji)
	- [NSString+YUEmpty](#NSString+YUEmpty)
	- [NSString+YUHash](#NSString+YUHash)
	- [NSString+YUMatch](#NSString+YUMatch)
	- [NSString+YUOther](#NSString+YUOther)
	- [NSString+YURegEx](#NSString+YURegEx)
	- [NSString+YUSerialization](#NSString+YUSerialization)
	- [NSString+YUSize](#NSString+YUSize)
	- [NSString+YUTimeFormat](#NSString+YUTimeFormat)
	
2. UIKit
- [UIBarButtonItem](#UIBarButtonItem)
	- [UIBarButtonItem+YUCustom](#UIBarButtonItem+YUCustom)
- [UIImage](#UIImage)
	- [UIImage+YUCompress](#UIImage+YUCompress)
	- [UIImage+YUCreateImage](#UIImage+YUCreateImage)
	- [UIImage+YUResize](#UIImage+YUResize)
- [UILabel](#UILabel)
	- [UILabel+YUTextSize](#UILabel+YUTextSize)
- [UIView](#UIView)
	- [UIView+YUFrame](#UIView+YUFrame)

## 1. Foundation 

### NSArray <div id="NSArray"></div>

#### NSArray+YUFormatNSLog <div id="NSArray+YUFormatNSLog"></div>
```
重写了 descriptionWithLocale 方法，作用是排版控制台的输出内容
- (NSString *)descriptionWithLocale:(id)locale;
```

#### NSArray+YUSafeAccess <div id="NSArray+YUSafeAccess"></div>
```
安全取出数组中的所对应类型的值
- (id)yu_objectAtIndex:(NSUInteger)index;
- (NSString *)yu_stringAtIndex:(NSUInteger)index;
- (NSNumber *)yu_numberAtIndex:(NSUInteger)index;
- (NSDecimalNumber *)yu_decimalNumberAtIndex:(NSUInteger)index;
- (NSArray *)yu_arrayAtIndex:(NSUInteger)index;
- (NSDictionary *)yu_dictionaryAtIndex:(NSUInteger)index;
- (NSInteger)yu_integerAtIndex:(NSUInteger)index;
- (NSUInteger)yu_unsignedIntegerAtIndex:(NSUInteger)index;
- (BOOL)yu_boolAtIndex:(NSUInteger)index;
- (int16_t)yu_int16AtIndex:(NSUInteger)index;
- (int32_t)yu_int32AtIndex:(NSUInteger)index;
- (int64_t)yu_int64AtIndex:(NSUInteger)index;
- (char)yu_charAtIndex:(NSUInteger)index;
- (short)yu_shortAtIndex:(NSUInteger)index;
- (float)yu_floatAtIndex:(NSUInteger)index;
- (double)yu_doubleAtIndex:(NSUInteger)index;
- (NSDate *)yu_dateAtIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
- (CGFloat)yu_CGFloatAtIndex:(NSUInteger)index;
- (CGPoint)yu_pointAtIndex:(NSUInteger)index;
- (CGSize)yu_sizeAtIndex:(NSUInteger)index;
- (CGRect)yu_rectAtIndex:(NSUInteger)index;

其中，包括了 NSMutableArray 的添加对象安全访问
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
```

#### NSArray+YUSerialization <div id="NSArray+YUSerialization"></div>
```
/**
 *  将“数组”序列化为 Json串
 *
 *  @return 返回nil 表示序列化失败
 */
- (NSString *)yu_serializationNSArrayToJson;
```


### NSAttributedString <div id="NSAttributedString"></div>

#### NSAttributedString+YUTextSize <div id="NSAttributedString+YUTextSize"></div>
```
/**
 *  计算 属性字符串 的大小
 *
 *  @param maxSize 最大尺寸
 *
 *  @return 计算后的尺寸
 */
- (CGSize)yu_sizeWithMaxSize:(CGSize)maxSize;
```


### NSDate <div id="NSDate"></div>

#### NSDate+YUFormat <div id="NSDate+YUFormat"></div>
```
常用的几种日期表示格式
typedef NS_ENUM(NSInteger, DateFormatMode) {
    /** 年月日  例如:20160101 */
    DateFormatModeNumber,
    
    /** 年-月-日  例如:2015-12-21 */
    DateFormatModeMinus,
    
    /** 年/月/日  例如:2015/12/21 */
    DateFormatModeInclinedLine,
    
    /** x年x月x日  例如:2016年01月01日 */
    DateFormatModeText
};
/**
 *  1.1 格式化当前(Now)日期
 *
 *  @param  系统日期格式
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)yu_dateWithSystemFormat:(DateFormatMode)dateFormatMode;
/**
 *  1.2 格式化指定日期，指定格式
 *
 *  @param  系统日期格式
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)yu_dateWith:(NSDate *)date systemDateFormat:(DateFormatMode)dateFormatMode;

/**
 *  2.1 格式化当前(Now)日期
 *
 *  @param  日期格式
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)yu_dateWithFormat:(NSString *)dateFormat;

/**
 *  2.2 格式化指定日期，指定格式
 *
 *  @param date       被格式化的日期
 *  @param dateFormat 日期格式
 *
 *  @return 字符串：格式化后的
 */
+ (NSString *)yu_dateWith:(NSDate *)date dateFormat:(NSString *)dateFormat;

/**
 *  3.1 格式化当前(Now)日期，后面拼接星期几
 *
 *  @param dateFormat 日期格式
 *
 *  @return 字符串：格式化后的
 */
+ (NSString *)yu_dateAppendWeekWith:(NSString *)dateFormat;

/**
 *  3.2 格式化指定日期，后面拼接星期几
 *
 *  @param dateFormat 日期格式
 *
 *  @return 字符串：格式化后的
 */
+ (NSString *)yu_dateAppendWeekWith:(NSDate *)date dateFormat:(NSString *)dateFormat;
```

#### NSDate+YUJudge <div id="NSDate+YUJudge"></div>
```
/**
 *  是否为今天
 */
- (BOOL)yu_isToday;
/**
 *  是否为昨天
 */
- (BOOL)yu_isYesterday;
/**
 *  是否为今年
 */
- (BOOL)yu_isThisYear;

/**
 *  返回一个只有年月日的时间 @"yyyy-MM-dd"
 */
- (NSDate *)yu_dateWithYMD;
```

#### NSDate+YUOther <div id="NSDate+YUOther"></div>
```
/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)yu_deltaWithNow;
```


### NSDictionary <div id="NSDictionary"></div>

#### NSDictionary+YUFormatNSLog <div id="NSDictionary+YUFormatNSLog"></div>
```
格式化（“美化”）控制台输出
重写 - (NSString *)descriptionWithLocale:(id)locale; 方法
```

#### NSDictionary+YUJSONString <div id="NSDictionary+YUJSONString"></div>
```
/**
 *  将“字典”序列化为 Json串
 *
 *  @return 返回nil 表示序列化失败
 */
- (NSString *)yu_serializationNSDictionaryToJson;
```

#### NSDictionary+YUSafeAccess <div id="NSDictionary+YUSafeAccess"></div>
```
安全使用字典
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
- (NSDate *)yu_dateForKey:(id)key
               dateFormat:(NSString *)dateFormat;
- (CGFloat)yu_CGFloatForKey:(id)key;
- (CGPoint)yu_pointForKey:(id)key;
- (CGSize)yu_sizeForKey:(id)key;
- (CGRect)yu_rectForKey:(id)key;

其中，包括了 NSMutableDictionary 的添加对象安全访问
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
```


### NSObject <div id="NSObject"></div>

#### NSObject+YUFileDelete <div id="NSObject+YUFileDelete"></div>
```
删除沙盒文件

/**
 *  1.删除 Document 目录下文件
 */
- (BOOL)yu_deleteDocumentFileWith:(NSString *)fileName;
/**
 *  2.删除 Library 目录下文件
 */
- (BOOL)yu_deleteLibraryFileWith:(NSString *)fileName;
/**
 *  3.删除 Caches 目录下文件
 */
- (BOOL)yu_deleteCachesFileWith:(NSString *)fileName;
/**
 *  4.删除 Tmp 目录下文件
 */
- (BOOL)yu_deleteTmpFileWith:(NSString *)fileName;

/**
 *  5.删除 指定目录下 文件
 */
- (BOOL)yu_deleteFileWithPathStr:(NSString *)pathStr fileName:(NSString *)fileName;
```


### NSString <div id="NSString"></div>

#### NSString+YUAppendPath <div id="NSString+YUAppendPath"></div>
```
在字符串之前追加路径，文件名在路径最后

/** 追加缓存路径 */
- (NSString *)yu_appendPathCache;

/** 追加临时路径 */
- (NSString *)yu_appendPathTmpDir;

/** 追加文档路径 */
- (NSString *)yu_appendPathDocument;
```

#### NSString+YUBase <div id="NSString+YUBase"></div>
```
/** base64编码 */
- (NSString *)yu_base64Encode;

/** base64解码 */
- (NSString *)yu_base64Decode;
```

#### NSString+YUEmoji <div id="NSString+YUEmoji"></div>
查询 emoji <http://emojipedia.org>
表情符号替换表<http://www.emoji-cheat-sheet.com>
```
/**
 返回一个字符串 
 如果发现替换代码在表情符号替换表<http://www.emoji-cheat-sheet.com>中出现，
 就会替换成相应的字符编码。
 例如：
 "This is a smiley face :smiley:"
 会被以下字符串替换：
 "This is a smiley face \U0001F604"
 */
- (NSString *)yu_emojiCheatCodesReplacingWithUnicode;

/**
 返回一个字符串 
 如果发现替换代码在表情符号替换表<http://www.emoji-cheat-sheet.com>中出现，
 就会替换成相应的字符编码。
 
 例如：
 "This is a smiley face \U0001F604"
 会被以下字符串替换：
 "This is a smiley face :smiley:"
 */
- (NSString *)yu_emojiUnicodeReplacingWithCheatCodes;


/**
 是否包含 emoji
 */
- (BOOL)yu_emojiIsIncluded;

/**
 删除掉包含的emoji
 */
- (instancetype)yu_emojiRemoved;
```

#### NSString+YUEmpty <div id="NSString+YUEmpty"></div>
```
一个或者多个空格也算是空
/** 判断字符串是否为空 */
- (BOOL)yu_isEmpty;
```

#### NSString+YUHash <div id="NSString+YUHash"></div>
```
/** MD5 加密(32位小) */
@property (readonly) NSString *yu_md5String;
/** sha1 哈希算法 */
@property (readonly) NSString *yu_sha1String;
/** sha256 哈希算法 */
@property (readonly) NSString *yu_sha256String;
/** sha521 哈希算法 */
@property (readonly) NSString *yu_sha512String;

/**
 HMAC是密钥相关的哈希运算消息认证码
 HMAC运算利用哈希算法，以一个密钥和一个消息为输入，生成一个消息摘要作为输出。
 作用：
 （1）验证TPM接受的授权数据和认证数据；
 （2）确认TPM接受到的命令请求是已授权的请求，并且，命令在传送的过程中没有被改动过
 */
- (NSString *)yu_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)yu_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)yu_hmacSHA512StringWithKey:(NSString *)key;
/**
 HMAC的应用
 hmac主要应用在身份验证中，它的使用方法是这样的：
 (1) 客户端发出登录请求（假设是浏览器的GET请求）
 (2) 服务器返回一个随机值，并在会话中记录这个随机值
 (3) 客户端将该随机值作为密钥，用户密码进行hmac运算，然后提交给服务器
 (4) 服务器读取用户数据库中的用户密码和步骤2中发送的随机值做与客户端一样的hmac运算，然后与用户发送的结果比较，如果结果一致则验证用户合法。
 
 在这个过程中，可能遭到安全攻击的是服务器发送的随机值和用户发送的hmac结果，而对于截获了这两个值的黑客而言这两个值是没有意义的，绝无获取用户密码的可能性，随机值的引入使hmac只在当前会话中有效，大大增强了安全性和实用性。大多数的语言都实现了hmac算法，比如php的mhash、python的hmac.py、java的MessageDigest类，在web验证中使用hmac也是可行的，用js进行md5运算的速度也是比较快的。
 */
```

#### NSString+YUMatch <div id="NSString+YUMatch"></div>
```
/**
 *  查找字符串中第一个匹配项
 *
 *  @param pattern 目标字符串
 *
 *  @return 结果字符串
 */
- (NSString *)yu_firstMatchWithPattern:(NSString *)pattern;

/**
 *  查找字符串中所有匹配项
 *
 *  @param pattern 匹配方案
 *
 *  @return 匹配数组（NSTextCheckingResult）
 */
- (NSArray *)yu_matchsWithPattern:(NSString *)pattern;
```

#### NSString+YUOther <div id="NSString+YUOther"></div>
```
/**
 *  数字末尾去0
 *
 *  @param 传入浮点型
 */
+ (NSString *)yu_stringChangeWithPrice:(CGFloat)value;
/**
 *  数字末尾去0
 *
 *  @param 传入字符串
 */
+ (NSString *)yu_stringChangeWithPriceStr:(NSString *)stringValue;

/** 截断首部和尾部的空白字符 */
- (NSString *)yu_trimString;
```

#### NSString+YURegEx <div id="NSString+YURegEx"></div>
```
/**
 *  手机号码的有效性:分电信、联通、移动和小灵通
 */
- (BOOL)yu_isMobileNumber;
/**
 *  手机号正则验证(以1开头11位数字)
 */
- (BOOL)yu_isMobileNumberSimpleRule;

/**
 *  密码正则验证(6-32位字母或数字组合)
 */
- (BOOL)yu_isPassword;

/**
 *  银行卡号
 */
- (BOOL)yu_isBankCardNumber;

/**
 *  6位数字(银行卡密码)
 */
- (BOOL)yu_isSixNumber;

/**
 *  纯汉字
 */
- (BOOL)yu_isChinese;

/**
 *  邮箱
 */
- (BOOL)yu_isEmailAddress;

/**
 *  网址
 */
- (BOOL)yu_isUrl;

/**
 *  IP地址有效性(IPV4)
 */
- (BOOL)yu_isIPV4Address;

/**
 *  简单的身份证号码
 */
- (BOOL)yu_isIDCardNumberSimple;
/**
 *  精确的身份证号码
 */
- (BOOL)yu_isIDCardNumber;

/**
 *  车牌
 */
- (BOOL)yu_isCarNumber;

/**
 *  Mac地址有效性
 */
- (BOOL)yu_isMacAddress;

/**
 *  邮政编码
 */
- (BOOL)yu_isPostalCode;

/**
 *  工商税号
 */
- (BOOL)yu_isTaxNo;


/**
 *  登录账号有效性
 *  @brief  是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 *
 *  @param minLenth            账号最小长度
 *  @param maxLenth            账号最长长度
 *  @param containChinese      是否包含中文
 *  @param firstCannotBeDigtal 首字母不能为数字
 *
 *  @return 正则验证成功返回YES, 否则返回NO
 */
- (BOOL)yu_isAccountWithMinLenth:(NSInteger)minLenth
                        maxLenth:(NSInteger)maxLenth
                  containChinese:(BOOL)containChinese
             firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 *  登录账号有效性
 *  @brief  是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 *  @param minLenth              账号最小长度
 *  @param maxLenth              账号最长长度
 *  @param containChinese        是否包含中文
 *  @param containDigtal         包含数字
 *  @param containLetter         包含字母
 *  @param containOtherCharacter 其他字符
 *  @param firstCannotBeDigtal   首字母不能为数字
 *
 *  @return 正则验证成功返回YES, 否则返回NO
 */
- (BOOL)yu_isAccountWithMinLenth:(NSInteger)minLenth
                        maxLenth:(NSInteger)maxLenth
                  containChinese:(BOOL)containChinese
                   containDigtal:(BOOL)containDigtal
                   containLetter:(BOOL)containLetter
           containOtherCharacter:(NSString *)containOtherCharacter
             firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;
```

#### NSString+YUSerialization <div id="NSString+YUSerialization"></div>
```
/**
 *  Json 串 反序列化为 NSDictionary
 */
- (NSDictionary *)yu_serializationJsonStringToDictionary;
```

#### NSString+YUSize <div id="NSString+YUSize"></div>
```
/**
 *  依据 "字体" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  依据 "字体属性" 返回字符串所占用的尺寸
 */
- (CGSize)yu_sizeWithAttributes:(NSDictionary *)attrs maxSize:(CGSize)maxSize;
```

### NSString+YUTimeFormat <div id="NSString+YUTimeFormat"></div>
```
/**
 *  将 “秒数” 转换为 几天几小时几分几秒
 */
+ (NSString *)yu_timeFormatted:(NSInteger)totalSeconds;

/**
 *  将 “秒数” 转换为 天:小时:分:秒
 */
+ (NSString *)yu_timeFormattedColon:(NSInteger)totalSeconds;
```



## 2. UIKit

### UIBarButtonItem <div id="UIBarButtonItem"></div>

#### UIBarButtonItem+YUCustom <div id="UIBarButtonItem+YUCustom"></div>
```
自定义 BarButtonItem 样式

/**
 *  1.只有图片
 */
+ (UIBarButtonItem *)yu_barButtonWithImage:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action;

/**
 *  2.只有文字
 */
+ (UIBarButtonItem *)yu_barButtonWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action;

/**
 *  3.图片在左，文字在右
 */
+ (UIBarButtonItem *)yu_barButtonWithImage:(NSString *)imageName
                                     title:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action;

/**
 *  4.文字在左，图片在右
 */
+ (UIBarButtonItem *)yu_barButtonWithTitle:(NSString *)title
                                     image:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action;
```

### UIImage <span id="UIImage"></span>

#### UIImage+YUCompress <a id="UIImage+YUCompress"></a>
```
//  压缩图片
//
//  图片的压缩其实是俩概念:
//  1、是 “压” 文件体积变小，但是像素数不变，长宽尺寸不变，那么质量可能下降，
//  2、是 “缩” 文件的尺寸变小，也就是像素数减少。长宽尺寸变小，文件体积同样会减小。
//  这个 UIImageJPEGRepresentation(image, 0.0)，是1的功能。
//  这个 [UIImage drawInRect:CGRectMake(0, 0, width, height)] 是2的功能。
//

// IEC标准
// 1GB 吉字节 = 1024 MB 兆字节
// 1MB 兆字节 = 1024 KB 千字节
// 1KB 千字节 = 1024 Byte 字节

// SI标准
// 1GB 吉字节 = 1000 MB 兆字节
// 1MB 兆字节 = 1000 KB 千字节
// 1KB 千字节 = 1000 Byte 字节

// 1 Byte 字节 = 8 bit 位

/****************************************修复图片方向************************************/
#pragma mark - 修复图片方向
// 拍摄之后的图片会在拍摄水平的基础上自动发生90°旋转

/**
 *  修复图片旋转
 */
+ (UIImage *)yu_fixOrientation:(UIImage *)image;

/****************************************改变图片尺寸************************************/
#pragma mark - 改变图片尺寸
/**
 *  1.改变图片尺寸，正方形图片，指定图片宽高尺寸
 */
+ (UIImage *)yu_scaleImage:(UIImage *)sourceImage withSize:(CGFloat)newSize;

/**
 *  2.改变图片尺寸，指定图片宽，高度根据宽度自动计算
 */
+ (UIImage *)yu_scaleImage:(UIImage *)sourceImage withWidth:(CGFloat)newWidth;

/**
 *  3.改变图片尺寸，指定图片高，宽度根据高度自动计算
 */
+ (UIImage *)yu_scaleImage:(UIImage *)sourceImage withHeight:(CGFloat)newHeight;

// Tips：如果改变的是正方形图片，上边方法1，2，3其实是等效的

/**
 *  4.压缩图片，指定图片的形变值
 *
 *  @param scale 形变值(百分比)
 */
+ (UIImage *)yu_scaleWithImage:(UIImage *)image scale:(CGFloat)scale;

/****************************************改变图片体积************************************/
#pragma mark - 改变图片体积
/**
 *  改变图片体积，使用PNG格式
 */
+ (NSData *)yu_compressByPNG:(UIImage *)sourceImage;

/**
 *  改变图片体积，使用JPEG格式
 */
+ (NSData *)yu_compressByJPEG:(UIImage *)sourceImage quality:(CGFloat)compressionQuality;

/**
 *  计算图片字节数 PNG格式
 */
+ (NSInteger)yu_computeBytesByPNG:(UIImage *)sourceImage;

/**
 *  计算图片字节数 JPEG格式
 */
+ (NSInteger)yu_computeBytesByJPEG:(UIImage *)sourceImage;
```

#### UIImage+YUCreateImage <div id="UIImage+YUCreateImage"></div>
```
/**
 用颜色生成图片，默认1x1

 @param color 颜色
 @return 生成的图片
 */
+ (UIImage *)yu_createImageWithColor:(UIColor *)color;


/**
 用颜色生成图片

 @param color 颜色
 @param size 图片尺寸
 @return 生成的图片
 */
+ (UIImage *)yu_createImageWithColor:(UIColor *)color size:(CGSize)size;
```

#### UIImage+YUResize <div id="UIImage+YUResize"></div>
```
//  图片拉伸平铺
//  注意：默认图片的模式是 UIImageResizingModeTile（瓦片）
//

/**
 *  无角度值,图片平铺
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName;

/**
 *  四个角角度值相等
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName capInsets:(CGFloat)capInsets;

/**
 *  自定义四个角度值
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName
                               top:(CGFloat)topCapInsets
                              left:(CGFloat)leftCapInsets
                            bottom:(CGFloat)bottomCapInsets
                             right:(CGFloat)rightCapInsets;

/**
 *  自定义四个角度值 和 图片模式
 */
+ (UIImage *)yu_resizableImageWith:(NSString *)imageName
                               top:(CGFloat)topCapInsets
                              left:(CGFloat)leftCapInsets
                            bottom:(CGFloat)bottomCapInsets
                             right:(CGFloat)rightCapInsets
                      resizingMode:(UIImageResizingMode)resizingMode;
```

### UILabel <div id="UILabel"></div>

#### UILabel+YUTextSize <div id="UILabel+YUTextSize"></div>
```
/**
 *  计算Label的内容大小
 */
- (CGSize)yu_textSize;
```

### UIView <div id="UIView"></div>

#### UIView+YUFrame <div id="UIView+YUFrame"></div>
```
适用于使用Frame布局

/** 1.当前View的x值*/
@property (nonatomic, assign) CGFloat yu_x;

/** 2.当前View的X最大值=x+width*/
@property (nonatomic, assign) CGFloat yu_xMax;

/** 3.当前View的y值*/
@property (nonatomic, assign) CGFloat yu_y;

/** 4.当前View的Y最大值=y+height*/
@property (nonatomic, assign) CGFloat yu_yMax;

//---------------------
/** 1.当前View的left值，对应x */
@property (nonatomic, assign) CGFloat yu_left;

/** 2.当前View的right值，对应xMax */
@property (nonatomic, assign) CGFloat yu_right;

/** 3.当前View的top值，对应y */
@property (nonatomic, assign) CGFloat yu_top;

/** 4.当前View的bottom值，对应yMax */
@property (nonatomic, assign) CGFloat yu_bottom;
//---------------------

/** 5.当前View的宽*/
@property (nonatomic, assign) CGFloat yu_width;

/** 6.当前View的高*/
@property (nonatomic, assign) CGFloat yu_height;

/** 7.当前View的中心x值*/
@property (nonatomic, assign) CGFloat yu_centerX;

/** 8.当前View的中心y值*/
@property (nonatomic, assign) CGFloat yu_centerY;

/** 9.当前View的大小*/
@property (nonatomic, assign) CGSize yu_size;
```




欢迎关注我的 新浪微博： 裕之都
工作QQ：1632212092

