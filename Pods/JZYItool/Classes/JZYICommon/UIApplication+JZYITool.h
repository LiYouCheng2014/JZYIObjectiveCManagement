//
//  UIApplication+JZYITool.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (JZYITool)

/**
 获取主窗口 不一定在最前面，像UIWAlert,键盘等
 
 @return 窗口
 */
+ (UIWindow *)getKeyWindow;

/**
 获取最前面的窗口
 
 @return 窗口
 */
+ (UIWindow *)getTopWindow;

/**
 获取当前VC
 
 @return 控制器
 */
+ (UIViewController *)getCurrentVC;

/**
 获取当前屏幕present出来的VC
 
 @return 控制器
 */
+ (UIViewController *)getPresentVC;

@end
