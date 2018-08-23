//
//  JZYIDataStore.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIDataStoreManagement.h"

#import <FastCoding/FastCoder.h>

static JZYIDataStoreManagement *store = nil;

@implementation JZYIDataStoreManagement

+ (instancetype)shareInstance
{
    static dispatch_once_t once_t;
    dispatch_once(&once_t, ^{
        store = (JZYIDataStoreManagement *)@"JZYIDataStoreManagement";
        store = [[JZYIDataStoreManagement alloc] init];
    });
    
    //防止子类使用
    NSString *classString = NSStringFromClass([self class]);
    if (![classString isEqualToString:@"JZYIDataStoreManagement"]) {
        NSParameterAssert(nil);
    }
    
    return store;
}

- (instancetype)init
{
    NSString *string = (NSString *)store;
    if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@"JZYIDataStoreManagement"]) {
        self = [super init];
        if (self) {
            //防止子类使用
            NSString *classString = NSStringFromClass([self class]);
            if (![classString isEqualToString:@"JZYIDataStoreManagement"]) {
                NSParameterAssert(nil);
            }
        }
        return self;
    }
    else {
        return nil;
    }
}

- (void)storeValue:(id)value withKey:(NSString *)key
{
    if (key && value) {
        NSData *data = [FastCoder dataWithRootObject:value];
        if (data) {
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
        }
    }
}

- (id)valueWithKey:(NSString *)key
{
    if (key) {
        NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:key];
        return [FastCoder objectWithData:data];
    }
    return nil;
}

@end
