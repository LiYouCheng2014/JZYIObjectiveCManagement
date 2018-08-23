//
//  JZYIBatteryInfo.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreGraphics/CGBase.h>
typedef NS_ENUM(NSInteger,JZYIBatteryState) {
    JZYIBatteryStateUnknown,
    JZYIBatteryStateUnplugged,    //未充电
    JZYIBatteryStateCharging,   //正在充电
    JZYIBatteryStateFull       //充满电
};

@interface JZYIBatteryInfo : NSObject

/**
 *  单例构造
 *
 *  @return 当前实例
 */
//+ (instancetype) currentBatteryInfo;

/**
 *  当前电池量
 *
 *  @return 0-1
 */
+ (CGFloat)currentBatteryLevel;

/**
 *  电池状态
 *
 *  @return 正在充电、未充电、充满电
 */
+ (JZYIBatteryState)batteryState;

/**
 *  电池是否允许监控
 *
 *  @return YES表示能够监控，NO表示不能够监控
 */
+ (BOOL)isAllowMonitorBattery;

@end
