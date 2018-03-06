//
//  UIColor+JZYIApp.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JZYIApp)

#pragma mark - UI所需颜色

/**
 用于重要级文字信息、内容标题信息
 
 @return 颜色
 */
+ (UIColor *)colorForMain;

/**
 小面积使用，用于特别需要突出的重要文字、按钮和ICON
 
 @return 颜色
 */
+ (UIColor *)colorForSpecial;

/**
 用于普通级别段落信息和文字
 
 @return 颜色
 */
+ (UIColor *)colorForNormal;

/**
 用于模块分割底色及背景底色
 
 @return 颜色
 */
+ (UIColor *)colorForBackground;

/**
 分隔线颜色
 
 @return 颜色
 */
+ (UIColor *)colorForLine;

@end
