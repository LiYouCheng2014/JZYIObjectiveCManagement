//
//  UIButton+JZYIImageLoad.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JZYIImageLoad)

- (void)jzyi_setImageWithString:(NSString *)urlString
                       forState:(UIControlState)state
               placeholderImage:(UIImage *)placeholderImage;

@end
