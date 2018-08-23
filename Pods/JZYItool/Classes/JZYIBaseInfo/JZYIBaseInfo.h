//
//  JZYIBaseInfo.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#ifndef JZYIBaseInfo_h
#define JZYIBaseInfo_h

//设备信息
#import "JZYIDeviceInfo.h"
//存储信息
#import "JZYIStorageInfo.h"
//电池信息
#import "JZYIBatteryInfo.h"
//屏幕信息
#import "JZYIScreenInfo.h"
//网络信息
#import "JZYINetWorkInfo.h"
//越狱信息
#import "JZYIJailBreak.h"
//定位信息 一般不用
#import "JZYILocationInfo.h"
//工程信息
#import "JZYIProjectInfo.h"
//VPN信息
#import "JZYIDeviceVPNInfo.h"
//ui距离信息
#import "JZYIUiInfo.h"

///自定义输出信息呢
#ifdef DEBUG
#define JZYILog(FORMAT, ...) fprintf(stderr, "%s:%d\t%s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define JZYILog(FORMAT, ...) nil
#endif

///弱引用和强引用
#define JZYI_WEAK_SELF(type)  __weak typeof(type) weak##type = type;
#define JZYI_STRONG_SELE(type) __strong typeof(type) strong##type = weak##type;


#endif /* JZYIBaseInfo_h */
