//
//  UIButton+JZYIImageLoad.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "UIButton+JZYIImageLoad.h"

#import <SDWebImage/UIButton+WebCache.h>

@implementation UIButton (JZYIImageLoad)

- (void)jzyi_setImageWithString:(NSString *)urlString
                       forState:(UIControlState)state
               placeholderImage:(UIImage *)placeholderImage
{
    NSURL *url = url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlString]];;
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholderImage];
}

@end
