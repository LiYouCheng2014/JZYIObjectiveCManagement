//
//  NSObject+DataStore.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "NSObject+JZYIDataStore.h"

#import "JZYIDataStoreManagement.h"

@implementation NSObject (JZYIDataStore)

- (void)storeValueWithKey:(NSString *)key
{
    [[JZYIDataStoreManagement shareInstance] storeValue:self withKey:key];
}

+ (id)valueWithKey:(NSString *)key
{
    return [[JZYIDataStoreManagement shareInstance] valueWithKey:key];
}

@end
