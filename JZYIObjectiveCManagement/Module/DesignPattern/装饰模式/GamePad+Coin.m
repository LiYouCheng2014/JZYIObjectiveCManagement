//
//  GamePad+Coin.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/15.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "GamePad+Coin.h"

#import <objc/runtime.h>

#import <Foundation/Foundation.h>

@implementation GamePad (Coin)

static const NSString *_coinStr = @"_coinStr";

- (void)setCoin:(NSInteger)coin {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(_coinStr), @(coin), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)coin {
    NSNumber *number = objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(_coinStr));
    return number.integerValue;
}

@end
