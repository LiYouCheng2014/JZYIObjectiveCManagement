//
//  JZYIDeviceVPNInfo.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 device link vpn status
 
 - DeviceLinkVPNStatusInvalid: The VPN is not configured.
 - DeviceLinkVPNStatusDisconnected: The VPN is disconnected.
 - DeviceLinkVPNStatusConnecting: The VPN is connecting.
 - DeviceLinkVPNStatusConnected: The VPN is connected.
 - DeviceLinkVPNStatusReasserting: The VPN is reconnecting following loss of underlying network connectivity.
 - DeviceLinkVPNStatusDisconnecting: The VPN is disconnecting.
 */
typedef NS_ENUM(NSInteger,DeviceLinkVPNStatus) {
    DeviceLinkVPNStatusInvalid = 201,
    DeviceLinkVPNStatusDisconnected,
    DeviceLinkVPNStatusConnecting,
    DeviceLinkVPNStatusConnected,
    DeviceLinkVPNStatusReasserting,
    DeviceLinkVPNStatusDisconnecting,
    DeviceLinkVPNStatusUnKnow
};

@interface JZYIDeviceVPNInfo : NSObject


/**
 get current link vpn status
 
 @return devicelinkvpnstatus
 */
+ (DeviceLinkVPNStatus)getCurrentDeviceLinkVpnSataus;

/**
 judge device connected vpn or not
 
 @return YES:Connected,NO:not connected
 */
+ (BOOL)isVPNConnected;

@end
