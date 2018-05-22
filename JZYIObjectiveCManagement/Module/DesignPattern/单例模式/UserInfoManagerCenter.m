//
//  UserInfoManagerCenter.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "UserInfoManagerCenter.h"

static UserInfoManagerCenter *center = nil;

@implementation UserInfoManagerCenter

+ (instancetype)managerCenter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        center = (UserInfoManagerCenter *)@"UserInfoManagerCenter";
        center = [[UserInfoManagerCenter alloc] init];
    });
    
    //防止子类使用
    NSString *classString = NSStringFromClass([self class]);
    if (![classString isEqualToString:@"UserInfoManagerCenter"]) {
        NSParameterAssert(nil);
    }
    
    
    
    return center;
}

- (instancetype)init
{
    NSString *string = (NSString *)center;
    if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@"UserInfoManagerCenter"]) {
        self = [super init];
        if (self) {
            //防止子类使用
            NSString *classString = NSStringFromClass([self class]);
            if (![classString isEqualToString:@"UserInfoManagerCenter"]) {
                NSParameterAssert(nil);
            }
        }
        return self;
    }
    else {
        return nil;
    }
}

@end
