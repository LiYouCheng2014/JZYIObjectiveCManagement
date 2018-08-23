//
//  JZYIPhoneOperatorInfo.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIPhoneOperatorInfo.h"

#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation JZYIPhoneOperatorInfo

+ (NSString *)getCurrentPhoneOperatorName
{
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    if (!carrier.isoCountryCode) {
        return nil;
    }
    return [carrier carrierName];
}

+ (NSString *)getCurrentISOCountryCode
{
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    if (!carrier.isoCountryCode) {
        return nil;
    }
    return [carrier isoCountryCode];
    
}

+ (NSString *)getMobileCountryCode
{
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    if (!carrier.isoCountryCode) {
        return nil;
    }
    return [carrier mobileCountryCode];
    
}

@end
