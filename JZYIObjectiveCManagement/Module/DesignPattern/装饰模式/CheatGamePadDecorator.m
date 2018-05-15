//
//  CheatGamePadDecorator.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/15.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "CheatGamePadDecorator.h"

@implementation CheatGamePadDecorator

- (void)cheat {
    [self up];
    [self down];
    [self up];
    [self down];
    [self left];
    [self right];
    [self left];
    [self right];
    [self commandA];
    [self commandB];
    [self commandA];
    [self commandB];
}

@end
