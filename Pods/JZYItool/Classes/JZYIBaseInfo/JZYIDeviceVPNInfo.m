//
//  JZYIDeviceVPNInfo.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIDeviceVPNInfo.h"

#import <NetworkExtension/NetworkExtension.h>

#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation JZYIDeviceVPNInfo

+ (DeviceLinkVPNStatus)getCurrentDeviceLinkVpnSataus
{
    NEVPNManager *vpnManage = [NEVPNManager sharedManager];
    [vpnManage loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    NEVPNConnection *connection = vpnManage.connection;
    
    DeviceLinkVPNStatus status;
    switch (connection.status) {
            case NEVPNStatusInvalid:
            status = DeviceLinkVPNStatusInvalid;
            break;
            case NEVPNStatusConnected:
            status = DeviceLinkVPNStatusConnected;
            break;
            case NEVPNStatusConnecting:
            status = DeviceLinkVPNStatusConnecting;
            break;
            case NEVPNStatusReasserting:
            status = DeviceLinkVPNStatusReasserting;
            break;
            case NEVPNStatusDisconnected:
            status = DeviceLinkVPNStatusDisconnected;
            break;
            case NEVPNStatusDisconnecting:
            status = DeviceLinkVPNStatusDisconnecting;
            break;
        default:
            status = DeviceLinkVPNStatusUnKnow;
            break;
    }
    return status;
}

+ (BOOL)isVPNConnected
{
    NSDictionary *dict = CFBridgingRelease(CFNetworkCopySystemProxySettings());
    NSArray *keys = [dict[@"__SCOPED__"]allKeys];
    for (NSString *key in keys) {
        if ([key rangeOfString:@"tap"].location != NSNotFound ||
            [key rangeOfString:@"tun"].location != NSNotFound ||
            [key rangeOfString:@"ppp"].location != NSNotFound){
            return YES;
        }
    }
    return NO;
}

@end
