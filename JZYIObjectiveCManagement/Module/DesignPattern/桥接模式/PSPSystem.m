//
//  PSPSystem.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/17.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "PSPSystem.h"

@implementation PSPSystem

- (void)loadSystem
{
    NSLog(@"PSP System");
}

- (void)command_x
{
    [self.implementor loadCommand:EcommandTypeX];
}

- (void)command_o
{
   [self.implementor loadCommand:EcommandTypeO];
}

@end
