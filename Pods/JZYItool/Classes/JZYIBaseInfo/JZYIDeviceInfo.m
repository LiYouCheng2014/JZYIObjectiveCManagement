//
//  JZYIDeviceInfo.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIDeviceInfo.h"

#import <sys/utsname.h>
#import <UIkit/UIDevice.h>

static NSString * const kMachine = @"machine";
static NSString * const kNodeName = @"nodename";
static NSString * const kRelease = @"release";
static NSString * const kSysName = @"sysname";
static NSString * const kVersion = @"version";

@interface JZYIDeviceInfo ()

//@property (nonatomic, strong) NSDictionary *utsNameDic;
//
//@property (nonatomic, strong) NSProcessInfo *processInfo;

//@property (nonatomic, strong) UIDevice *device;
@end

@implementation JZYIDeviceInfo
//
//+ (instancetype)currentDeviceInfo {
//    static JZYIDeviceInfo *info = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        info = [[self alloc] init];
//    });
//    return info;
//}

//-------
+ (NSInteger)getNuclearCount
{
    return [NSProcessInfo processInfo].processorCount;
}

+ (NSInteger)getActiveNuclearCount
{
    return [NSProcessInfo processInfo].activeProcessorCount;
}

//--------
+ (NSString *)getKernelVersion
{
    return [JZYIDeviceInfo getSystemInfo][kRelease];
}

+ (NSString *)getDarwinBuildDescription
{
    return [JZYIDeviceInfo getSystemInfo][kVersion];
}

+ (NSString *)getOSName
{
    return [JZYIDeviceInfo getSystemInfo][kSysName];
}

+ (NSString *)getHardWardType
{
    return [JZYIDeviceInfo getSystemInfo][kMachine];
}

+ (NSString *)getNetWordNodeName
{
    return [JZYIDeviceInfo getSystemInfo][kNodeName];
}

//---------9.3.4
+ (NSString *)getSystemName
{
    return [UIDevice currentDevice].systemName;
}

+ (NSString *)getSystemVersion
{
    return [UIDevice currentDevice].systemVersion;
}

+ (BOOL)multitaskingSupported
{
    return [UIDevice currentDevice].multitaskingSupported;
}

+ (NSString *)getUUID
{
    return [[UIDevice currentDevice].identifierForVendor UUIDString];
}

+ (NSString *)getCurrentDeviceName
{
    return [UIDevice currentDevice].name;
}

+ (NSString *)getDeviceType
{
    return [UIDevice currentDevice].model;
}

+ (NSString *)getCurrentDevicePhoneType
{
    NSString *platform = [JZYIDeviceInfo getSystemInfo][kMachine];;
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    return platform;
    
}

+ (NSDictionary *)getSystemInfo
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSDictionary *dict = @{kSysName:[NSString stringWithCString:systemInfo.sysname encoding:NSUTF8StringEncoding],kNodeName:[NSString stringWithCString:systemInfo.nodename encoding:NSUTF8StringEncoding],kRelease:[NSString stringWithCString:systemInfo.release encoding:NSUTF8StringEncoding],kVersion:[NSString stringWithCString:systemInfo.version encoding:NSUTF8StringEncoding],kMachine:[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]};
    return dict;
}

#pragma mark - Lazy Load
//- (UIDevice *)device {
//    if (!_device) {
//        _device = [UIDevice currentDevice];
//    }
//    return _device;
//}

//- (NSDictionary *)utsNameDic {
//    if (!_utsNameDic) {
//        struct utsname systemInfo;
//        uname(&systemInfo);
//        _utsNameDic = @{kSysName:[NSString stringWithCString:systemInfo.sysname encoding:NSUTF8StringEncoding],kNodeName:[NSString stringWithCString:systemInfo.nodename encoding:NSUTF8StringEncoding],kRelease:[NSString stringWithCString:systemInfo.release encoding:NSUTF8StringEncoding],kVersion:[NSString stringWithCString:systemInfo.version encoding:NSUTF8StringEncoding],kMachine:[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]};
//    }
//    return _utsNameDic;
//}

//- (NSProcessInfo *)processInfo {
//    if (!_processInfo) {
//        _processInfo = [NSProcessInfo processInfo];
//    }
//    return _processInfo;
//}

@end
