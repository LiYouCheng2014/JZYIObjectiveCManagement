//
//  JZYIUtilsMacro.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#ifndef JZYIUtilsMacro_h
#define JZYIUtilsMacro_h

///自定义输出信息呢
#ifndef __OPTIMIZE__
#   define JZYILog(fmt, ...) NSLog((@"%s [File %s: Line %d] \n" fmt), __PRETTY_FUNCTION__, __FILE__, __LINE__, ##__VA_ARGS__)
#   define ELog(err) {if(err) JZYILog(@"%@", err);}
#else
#   define JZYILog(...)
#endif

///弱引用和强引用
#define JZYI_WEAK_SELF(type)  __weak typeof(type) weak##type = type;
#define JZYI_STRONG_SELF(type)  __strong typeof(type) type = weak##type;

#pragma mark - 位置大小

///获取屏幕宽度与高度
#define JZYI_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define JZYI_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

//适应横屏竖屏
#define JZYI_SCREEN_MAX_LENGTH     MAX(JZYI_SCREEN_WIDTH, JZYI_SCREEN_HEIGHT)
#define JZYI_SCREEN_MIN_LENGTH     MIN(JZYI_SCREEN_WIDTH, JZYI_SCREEN_HEIGHT)

///状态栏高度
#define JZYI_STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

///导航条高度
#define JZYI_NVAIGATION_HEIGHT 44.f

///标签栏高度
#define JZYI_TAB_BAR_HEIGHT (JZYI_STATUS_BAR_HEIGHT > 20 ? 83.f : 49.f)

///安全高度
#define JZYI_SAFE_HEIGHT 34.f

///顶部总高度
#define JZYI_TOP_HEIGHT (JZYI_STATUS_BAR_HEIGHT + JZYI_NVAIGATION_HEIGHT)

#endif /* JZYIUtilsMacro_h */
