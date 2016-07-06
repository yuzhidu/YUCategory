//
//
//  关注微博：裕之都
//  微博地址：http://weibo.com/gou9527
//
//  Github：https://github.com/yuzhidu
//  Copyright © 裕之都. All rights reserved.
//
//  删除沙盒文件
//

#import "NSObject+YUFileDelete.h"

static NSString *const kAccountFile = @"account.data";
static NSString *const kRecordAudioFile = @"myRecord.wav";

@implementation NSObject (YUFileDelete)
/**
 *  1.删除 Document 目录下文件
 */
- (BOOL)yu_deleteDocumentFileWith:(NSString *)fileName {
    return [self yu_deleteFileWithDirPath:NSDocumentDirectory fileName:fileName];
}
/**
 *  2.删除 Library 目录下文件
 */
- (BOOL)yu_deleteLibraryFileWith:(NSString *)fileName {
    return [self yu_deleteFileWithDirPath:NSLibraryDirectory fileName:fileName];
}
/**
 *  3.删除 Caches 目录下文件
 */
- (BOOL)yu_deleteCachesFileWith:(NSString *)fileName {
    return [self yu_deleteFileWithDirPath:NSCachesDirectory fileName:fileName];
}
/**
 *  4.删除 Tmp 目录下文件
 */
- (BOOL)yu_deleteTmpFileWith:(NSString *)fileName {
    NSString *uniquePath = NSTemporaryDirectory();
    return [self yu_deleteFileWithPathStr:uniquePath fileName:fileName];
}

- (BOOL)yu_deleteFileWithDirPath:(NSSearchPathDirectory)dirPath fileName:(NSString *)fileName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(dirPath, NSUserDomainMask, YES);
    // 文件路径
    NSString *uniquePath = [[paths firstObject] stringByAppendingPathComponent:fileName];
    
    return [self yu_deleteFileWithPathStr:uniquePath fileName:fileName];
}

/**
 *  5.删除 指定目录下 文件
 */
- (BOOL)yu_deleteFileWithPathStr:(NSString *)pathStr fileName:(NSString *)fileName {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL haveFile = [fileManager fileExistsAtPath:pathStr];
    
    if (! haveFile) {
        // File not exist
        return NO;
    }
    else {
        // File exist
        return [fileManager removeItemAtPath:pathStr error:nil];
    }
}


//--------------------------------我自己用的-------------------------------//
- (BOOL)yu_deleteAccountFile {
    return [self yu_deleteDocumentFileWith:kAccountFile];
}

- (BOOL)yu_deleteVoiceFile {
    return [self yu_deleteTmpFileWith:kRecordAudioFile];
}
@end
