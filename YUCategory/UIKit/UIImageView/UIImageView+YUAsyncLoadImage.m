//
//  UIImageView+YUAsyncLoadImage.m
//  YUCategoryDemo
//
//  Created by mayubo on 2018/9/20.
//  Copyright © 2018年 mayubo. All rights reserved.
//

#import "UIImageView+YUAsyncLoadImage.h"

@implementation UIImageView (YUAsyncLoadImage)

- (void)yu_setImageWithName:(NSString *)imageName {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *img = [UIImage imageNamed:imageName];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = img;
        });
    });
}

@end
