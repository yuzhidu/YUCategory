//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
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

#import "UIImage+YUCompress.h"

@implementation UIImage (YUCompress)
/****************************************改变图片尺寸************************************/
#pragma mark - 改变图片尺寸
/**
 *  通用方法
 */
- (UIImage *)yu_drawWithWidth:(CGFloat)width height:(CGFloat)height {
    
    // 使用图形上下文处理
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    [self drawInRect:CGRectMake(0, 0, width, height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  1.改变图片尺寸，正方形图片，指定图片宽高尺寸
 */
- (UIImage *)yu_scaleWithSize:(CGFloat)newSize {
    
    return [self yu_drawWithWidth:newSize height:newSize];
}

/**
 *  2.改变图片尺寸，指定图片宽，高度根据宽度自动计算
 */
- (UIImage *)yu_scaleWithWidth:(CGFloat)newWidth {
    
    CGFloat newHeight = (newWidth * self.size.height) / self.size.width;
    
    return [self yu_drawWithWidth:newWidth height:newHeight];
}

/**
 *  3.改变图片尺寸，指定图片高，宽度根据高度自动计算
 */
- (UIImage *)yu_scaleWithHeight:(CGFloat)newHeight {
    
    CGFloat newWidth = (newHeight * self.size.width) / self.size.height;
    
    return [self yu_drawWithWidth:newWidth height:newHeight];
}

/****************************************改变图片体积************************************/
#pragma mark - 改变图片体积

/**
 *  改变图片体积，使用PNG格式
 */
- (NSData *)yu_compressByPNG {
    
    // return image as PNG.
    // May return nil if image has no CGImageRef or invalid bitmap format
    return UIImagePNGRepresentation(self);
}

/**
 *  改变图片体积，使用JPEG格式
 */
- (NSData *)yu_compressByJPEG_WithQuality:(CGFloat)compressionQuality {
    
    // return image as JPEG.
    // May return nil if image has no CGImageRef or invalid bitmap format.
    // compression is 0(most)..1(least)
    if (compressionQuality > 1 || compressionQuality < 0) {
        return nil;
    }
    else {
        return UIImageJPEGRepresentation(self, compressionQuality);
    }
}

/**
 *  计算图片字节数 PNG格式
 */
- (NSInteger)yu_computeBytesByPNG {
    
    NSData *data = UIImagePNGRepresentation(self);
    return [data length];
}
/**
 *  计算图片字节数 JPEG格式
 */
- (NSInteger)yu_computeBytesByJPEG {
    
    NSData *data = UIImageJPEGRepresentation(self, 1);
    return [data length];
}

@end
