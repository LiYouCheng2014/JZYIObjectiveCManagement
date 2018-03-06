//
//  UIColor+JZYIApp.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "UIColor+JZYIApp.h"

#import "JZYICategory.h"

@implementation UIColor (JZYIApp)

#pragma mark - UI所需颜色
//小面积使用，用于特别需要突出的重要文字、按钮和ICON
+ (UIColor *)colorForMain
{
    return [UIColor getColor:@"d81918"];
}

//用于重要级文字信息、内容标题信息
+ (UIColor *)colorForSpecial
{
    return [UIColor getColor:@"404040"];
}

//用于普通级别段落信息和文字
+ (UIColor *)colorForNormal
{
    return [UIColor getColor:@"989898"];
}

//用于模块分割底色及背景底色
+ (UIColor *)colorForBackground
{
    return [UIColor getColor:@"f8f8f8"];
}

//分隔线，用于列表和模块等重要分隔线CCCBCF
+ (UIColor *)colorForLine
{
    return [UIColor getColor:@"eaeaea"];
}

@end
