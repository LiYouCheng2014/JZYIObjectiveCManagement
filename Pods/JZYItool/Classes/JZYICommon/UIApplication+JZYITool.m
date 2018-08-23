//
//  UIApplication+JZYITool.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "UIApplication+JZYITool.h"

@implementation UIApplication (JZYITool)

/**
 获取主窗口 不一定在最前面，像UIWAlert,键盘等

 @return 窗口
 */
+ (UIWindow *)getKeyWindow
{
    if (@available(iOS 5.0, *)) {
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        //[[[UIApplication sharedApplication] delegate] window];
        return window;
    } else {
        return nil;
    }
}

/**
 获取最前面的窗口

 @return 窗口
 */
+ (UIWindow *)getTopWindow
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    return window;
}

/**
 获取当前VC

 @return 控制器
 */
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow *window = [UIApplication getKeyWindow];
    //获取正常的window
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [UIApplication sharedApplication].windows;
        for (UIWindow *tempWindow in windows) {
            if (tempWindow.windowLevel == UIWindowLevelNormal) {
                window = tempWindow;
                break;
            }
        }
    }
    
    //获取控制器
    UIView *frontView = [[window subviews] firstObject];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = window.rootViewController;
        return result;
    }
    else {
        result = window.rootViewController;
    }
    
    return result;
}

/**
 获取当前屏幕present出来的VC

 @return 控制器
 */
+ (UIViewController *)getPresentVC
{
    UIWindow *window = [UIApplication getKeyWindow];
    UIViewController *appRootVC = window.rootViewController;
    UIViewController *topVC = appRootVC;
    
    if (@available(iOS 5.0, *)) {
        while (topVC.presentedViewController) {
            topVC = topVC.presentedViewController;
        }
    } else {
        // Fallback on earlier versions
    }
    
    return topVC;
}

@end
