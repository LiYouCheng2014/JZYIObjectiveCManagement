//
//  UIFont+JZYITool.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "UIFont+JZYITool.h"

static CGFloat kFont20 = 20;
static CGFloat kFont22 = 22;
static CGFloat kFont24 = 24;
static CGFloat kFont26 = 26;
static CGFloat kFont28 = 28;
static CGFloat kFont30 = 30;
static CGFloat kFont32 = 32;
static CGFloat kFont34 = 34;
static CGFloat kFont36 = 36;
static CGFloat kFont38 = 38;
static CGFloat kFont40 = 40;
static CGFloat kFont42 = 42;
static CGFloat kFont44 = 44;
static CGFloat kFont46 = 46;
static CGFloat kFont48 = 48;
static CGFloat kFont50 = 50;
static CGFloat kFont60 = 60;

//特殊
static CGFloat kFont76 = 76;

//先以0.5倍比例进行替换
#define PT_SCALE 0.5f

@implementation UIFont (JZYITool)

+ (UIFont *)fontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Helvetica-Light" size:(size * PT_SCALE)];
}

+ (UIFont *)boldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Helvetica" size:(size * PT_SCALE)];
}

#pragma mark - 常用字体

+ (UIFont *)fontForNavigation
{
    return [UIFont fontFor36];
}

+ (UIFont *)fontForTitle
{
    return [UIFont fontFor32];
}

+ (UIFont *)fontForSubTitle
{
    return [UIFont fontFor28];
}

+ (UIFont *)fontForContent
{
    return [UIFont fontFor28];
}

#pragma mark - 正常字体

+ (UIFont *)fontFor20
{
    return [UIFont fontWithSize:kFont20];
}

+ (UIFont *)fontFor22
{
    return [UIFont fontWithSize:kFont22];
}

+ (UIFont *)fontFor24
{
    return [UIFont fontWithSize:kFont24];
}

+ (UIFont *)fontFor26
{
    return [UIFont fontWithSize:kFont26];
}

+ (UIFont *)fontFor28
{
    return [UIFont fontWithSize:kFont28];
}

+ (UIFont *)fontFor30
{
    return [UIFont fontWithSize:kFont30];
}

+ (UIFont *)fontFor32
{
    return [UIFont fontWithSize:kFont32];
}

+ (UIFont *)fontFor34
{
    return [UIFont fontWithSize:kFont34];
}

+ (UIFont *)fontFor36
{
    return [UIFont fontWithSize:kFont36];
}

+ (UIFont *)fontFor38
{
    return [UIFont fontWithSize:kFont38];
}

+ (UIFont *)fontFor40
{
    return [UIFont fontWithSize:kFont40];
}

+ (UIFont *)fontFor42
{
    return [UIFont fontWithSize:kFont42];
}

+ (UIFont *)fontFor44
{
    return [UIFont fontWithSize:kFont44];
}

+ (UIFont *)fontFor46
{
    return [UIFont fontWithSize:kFont46];
}

+ (UIFont *)fontFor48
{
    return [UIFont fontWithSize:kFont48];
}

+ (UIFont *)fontFor50
{
    return [UIFont fontWithSize:kFont50];
}

+ (UIFont *)fontFor60
{
    return [UIFont fontWithSize:kFont60];
}

+ (UIFont *)fontFor76
{
    return [UIFont fontWithSize:kFont76];
}

#pragma mark - 加粗字体

+ (UIFont *)boldFontFor20
{
    return [UIFont boldFontWithSize:kFont20];
}

+ (UIFont *)boldFontFor22
{
    return [UIFont boldFontWithSize:kFont22];
}

+ (UIFont *)boldFontFor24
{
    return [UIFont boldFontWithSize:kFont24];
}

+ (UIFont *)boldFontFor26
{
    return [UIFont boldFontWithSize:kFont26];
}

+ (UIFont *)boldFontFor28
{
    return [UIFont boldFontWithSize:kFont28];
}

+ (UIFont *)boldFontFor30
{
    return [UIFont boldFontWithSize:kFont30];
}

+ (UIFont *)boldFontFor32
{
    return [UIFont boldFontWithSize:kFont32];
}

+ (UIFont *)boldFontFor34
{
    return [UIFont boldFontWithSize:kFont34];
}

+ (UIFont *)boldFontFor36
{
    return [UIFont boldFontWithSize:kFont36];
}

+ (UIFont *)boldFontFor38
{
    return [UIFont boldFontWithSize:kFont38];
}

+ (UIFont *)boldFontFor40
{
    return [UIFont boldFontWithSize:kFont40];
}

+ (UIFont *)boldFontFor42
{
    return [UIFont boldFontWithSize:kFont42];
}

+ (UIFont *)boldFontFor44
{
    return [UIFont boldFontWithSize:kFont44];
}

+ (UIFont *)boldFontFor46
{
    return [UIFont boldFontWithSize:kFont46];
}

+ (UIFont *)boldFontFor48
{
    return [UIFont boldFontWithSize:kFont48];
}

+ (UIFont *)boldFontFor50
{
    return [UIFont boldFontWithSize:kFont50];
}

+ (UIFont *)boldFontFor60
{
    return [UIFont boldFontWithSize:kFont60];
}

+ (UIFont *)boldFontFor76
{
    return [UIFont boldFontWithSize:kFont76];
}

@end
