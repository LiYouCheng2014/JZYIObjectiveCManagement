//
//  DeviceFactory.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseDevice.h"

typedef enum : NSUInteger {
    EDeviceTypePhone = 0x11,
    EDeviceTypeAndroid,
    EDeviceTypeNokia,
} EDeviceType;

@interface DeviceFactory : NSObject

+ (BaseDevice <PhoneProtocol>*)deviceFactoryWithType:(EDeviceType)type;

@end
