//
//  NSObject+StoreValue.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "NSObject+StoreValue.h"

#import "StoreValue.h"

@implementation NSObject (StoreValue)

- (void)storeValueWithKey:(NSString *)key
{
    [[StoreValue shareInstance] storeValue:self withKey:key];
}

+ (id)valueWithKey:(NSString *)key
{
    return [[StoreValue shareInstance] valueWithKey:key];
}

@end
