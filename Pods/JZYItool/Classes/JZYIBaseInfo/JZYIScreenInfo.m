//
//  JZYIScreenInfo.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIScreenInfo.h"

#import <UIkit/UIScreen.h>
@interface JZYIScreenInfo ()

//@property (nonatomic, strong) UIScreen *screen;

@end

@implementation JZYIScreenInfo

//#pragma mark - init method
//+ (instancetype)currentScreenInfo {
//    static JZYIScreenInfo *screenInfo = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        screenInfo = [[self alloc] init];
//    });
//    return screenInfo;
//}

#pragma mark - method
+ (CGFloat)getCurrentScreenWith
{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)getCurrentScreenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)getScreenBrightness
{
    return [UIScreen mainScreen].brightness;
}

+ (NSString *)screenResolution
{
    return [NSString stringWithFormat:@"%.0f_%.0f",[UIScreen mainScreen].scale*[UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].scale*[UIScreen mainScreen].bounds.size.width];
}

+ (CGFloat)getScreenDpi
{
    float scale = 1;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        scale = [[UIScreen mainScreen] scale];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return 132*scale;
    }else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        return 163*scale;
    }else {
        return 160*scale;
    }
}

//#pragma mark - Lazy Load
//- (UIScreen *)screen {
//    if (!_screen) {
//        _screen = [UIScreen mainScreen];
//    }
//    return _screen;
//}

@end
