//
//  JZYIBusinessCardAdapter.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIBusinessCardAdapter.h"

@implementation JZYIBusinessCardAdapter

- (instancetype)initWithData:(id)data
{
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}

- (NSString *)name {
    return nil;
}

- (UIColor *)lineColor {
    return nil;
}

- (NSString *)phoneNumber {
    return nil;
}

@end
