//
//  UIImage+JZYITool.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JZYITool)

/**
 颜色转图片

 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

//颜色转图片

/**
 颜色转图片

 @param color 颜色
 @param frame 位置大小
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color
                      frame:(CGRect)frame;

/**
 图片写入文件

 @param fileName 文件名
 @return 路径
 */
- (NSString *)imageWriteFileName:(NSString *)fileName;

@end
