//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  Hash 加密
//

#import <Foundation/Foundation.h>

@interface NSString (YUHash)
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

@end
