//
//  JZYIUiInfo.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIUiInfo.h"

@implementation JZYIUiInfo

+ (CGFloat)getNavigationHeight
{
    return 44.f;
}

+ (CGFloat)getStatusBarHeight
{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

+ (CGFloat)getSafeHeight
{
    return 34.f;
}

+ (CGFloat)getTopHeight
{
    return [self getNavigationHeight] + [self getStatusBarHeight];
}

+ (CGFloat)getTabbarHeight
{
    return [self getStatusBarHeight] > 20 ? 83.f : 49.f;
}

+ (CGFloat)getTopSpacing
{
    return 15.f;
}

+ (CGFloat)getLeftSpacing
{
    return 15.f;
}

+ (CGFloat)getBottomSpacing
{
    return 15.f;
}

+ (CGFloat)getRightSpacing
{
    return 15.f;
}

+ (CGFloat)getLineWidth;
{
    return 0.5f;
}

+ (CGFloat)getVerticalSpacing
{
    return 7.f;
}

+ (CGFloat)getHorizontalSpacing
{
    return 10.f;
}

+ (CGFloat)getCornerRadius
{
    return 5.f;
}

@end
