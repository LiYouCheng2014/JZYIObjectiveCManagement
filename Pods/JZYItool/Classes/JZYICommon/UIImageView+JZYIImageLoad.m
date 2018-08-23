//
//  UIImageView+JZYIImageLoad.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "UIImageView+JZYIImageLoad.h"

#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (JZYIImageLoad)

- (void)jzyi_setImageWithString:(NSString *)urlString
               placeholderImage:(UIImage *)placeholderImage
{
    NSURL *url = url = [NSURL URLWithString:urlString];;
    [self sd_setImageWithURL:url placeholderImage:placeholderImage];
}

@end
