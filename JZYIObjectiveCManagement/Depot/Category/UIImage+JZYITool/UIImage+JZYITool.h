//
//  UIImage+JZYITool.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JZYITool)

/**
 颜色转图片
 
 @param color 颜色值
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 颜色转图片
 
 @param color 颜色值
 @param frame 大小
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color
                      frame:(CGRect)frame;

@end
