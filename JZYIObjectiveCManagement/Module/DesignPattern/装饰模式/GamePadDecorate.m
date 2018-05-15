//
//  GamePadDecorate.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/15.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "GamePadDecorate.h"

#import "GamePad.h"
@interface GamePadDecorate ()

@property (nonatomic, strong) GamePad *gamePad; //!<

@end

@implementation GamePadDecorate

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gamePad = [[GamePad alloc] init];
    }
    return self;
}

/**
 上下左右
 */
- (void)up
{
    [self.gamePad up];
}

- (void)down
{
    [self.gamePad down];
}

- (void)left
{
    [self.gamePad left];
}

- (void)right
{
    [self.gamePad right];
}


/**
 选择与开始
 */
- (void)select
{
    [self.gamePad select];
}

- (void)start
{
    [self.gamePad start];
}


/**
 按钮A+B+X+Y
 */
- (void)commandA
{
    [self.gamePad commandA];
}

- (void)commandB
{
    [self.gamePad commandB];
}

- (void)commandX
{
    [self.gamePad commandX];
}

- (void)commandY
{
    [self.gamePad commandY];
}


@end
