//
//  UIColor+JZYITool.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JZYITool)

/**
 随机颜色
 
 @return 颜色
 */
+ (UIColor *)randomColor;

/**
 16进制转颜色
 
 @param hexColor 16进制（6位）
 @return 颜色
 */
+ (UIColor *)getColor:(NSString *)hexColor;

@end
