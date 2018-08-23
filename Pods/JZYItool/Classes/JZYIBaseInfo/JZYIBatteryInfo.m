//
//  JZYIBatteryInfo.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIBatteryInfo.h"

#import <UIkit/UIDevice.h>

@interface JZYIBatteryInfo ()

//@property (nonatomic, strong) UIDevice *device;

@end

@implementation JZYIBatteryInfo

//+ (instancetype)currentBatteryInfo {
//    static JZYIBatteryInfo *info= nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        info = [[self alloc] init];
//    });
//    return info;
//
//}

+ (JZYIBatteryState)batteryState
{
    switch ([UIDevice currentDevice].batteryState) {
            case UIDeviceBatteryStateFull:
            return JZYIBatteryStateFull;
            break;
            case UIDeviceBatteryStateUnknown:
            return JZYIBatteryStateUnknown;
            break;
            case UIDeviceBatteryStateCharging:
            return JZYIBatteryStateCharging;
            break;
            case UIDeviceBatteryStateUnplugged:
            return JZYIBatteryStateUnplugged;
            break;
        default:
            return JZYIBatteryStateUnknown;
            break;
    }
}

+ (CGFloat)currentBatteryLevel
{
    return [UIDevice currentDevice].batteryLevel;
}

+ (BOOL)isAllowMonitorBattery
{
    return [UIDevice currentDevice].isBatteryMonitoringEnabled;
}

//#pragma mark - Lazy Load
//- (UIDevice *)device {
//    if (!_device) {
//        _device = [UIDevice currentDevice];
//    }
//    return _device;
//}

@end
