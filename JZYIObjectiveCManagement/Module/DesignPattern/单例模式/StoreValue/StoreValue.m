//
//  StoreValue.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "StoreValue.h"

#import <FastCoding/FastCoder.h>

static StoreValue *center = nil;

@implementation StoreValue

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        center = (StoreValue *)@"StoreValue";
        center = [[StoreValue alloc] init];
    });
    
    //防止子类使用
    NSString *classString = NSStringFromClass([self class]);
    if (![classString isEqualToString:@"StoreValue"]) {
        NSParameterAssert(nil);
    }
    
    
    
    return center;
}

- (instancetype)init
{
    NSString *string = (NSString *)center;
    if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@"StoreValue"]) {
        self = [super init];
        if (self) {
            //防止子类使用
            NSString *classString = NSStringFromClass([self class]);
            if (![classString isEqualToString:@"StoreValue"]) {
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
    NSParameterAssert(key);
    NSParameterAssert(value);
    
    NSData *data = [FastCoder dataWithRootObject:value];
    if (data) {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    }
}

- (id)valueWithKey:(NSString *)key
{
    NSParameterAssert(key);
    
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return [FastCoder objectWithData:data];
}


@end
