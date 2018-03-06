//
//  UIColor+JZYITool.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JZYITool)

#pragma mark - 工具

/**
 随机颜色
 
 @return 颜色
 */
+ (UIColor *)randomColor;

/**
 颜色转图片
 
 @param color 颜色
 @param frame 位置和大小
 @return 图片
 */
+ (UIImage *)imageFromColor:(UIColor *)color
                      frame:(CGRect)frame;

/**
 16进制转颜色
 
 @param hexColor 16进制（6位）
 @return 颜色
 */
+ (UIColor *)getColor:(NSString *)hexColor;

@end
