//
//  DeviceFactory.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "DeviceFactory.h"

#import "iPhoneDevice.h"
#import "AndroidDevice.h"

@implementation DeviceFactory

+ (BaseDevice <PhoneProtocol>*)deviceFactoryWithType:(EDeviceType)type
{
    BaseDevice <PhoneProtocol> * device = nil;
    
    if (type == EDeviceTypePhone) {
        device = [[iPhoneDevice alloc] init];
    }
    else if (type == EDeviceTypeAndroid) {
        device = [[AndroidDevice alloc] init];
    }
    return device;
}

@end
