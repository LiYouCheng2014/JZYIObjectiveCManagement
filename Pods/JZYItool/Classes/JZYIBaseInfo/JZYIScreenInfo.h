//
//  JZYIScreenInfo.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreGraphics/CGBase.h>

@interface JZYIScreenInfo : NSObject

/**
 *  单例构建当前屏幕信息
 *
 *  @return 当前对象实例
 */
//+ (instancetype)currentScreenInfo;

/**
 *  得到当前屏幕宽度
 *
 *  @return 宽度值
 */
+ (CGFloat)getCurrentScreenWith;

/**
 *  得到当前屏幕高度
 *
 *  @return 高度值
 */
+ (CGFloat)getCurrentScreenHeight;

/**
 *  得到屏幕亮度
 *
 *  @return 0-1
 */
+ (CGFloat)getScreenBrightness;

/**
 *  屏幕分辨率
 *
 *  @return xx
 */
+ (NSString *)screenResolution;

/**
 *  获取dpi
 *
 *  @return dpi的值,参考：http://stackoverflow.com/questions/3860305/get-ppi-of-iphone-ipad-ipod-touch-at-runtime
 */
+ (CGFloat)getScreenDpi;

@end
