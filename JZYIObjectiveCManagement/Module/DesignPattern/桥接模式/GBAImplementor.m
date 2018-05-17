//
//  GBAImplementor.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/17.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "GBAImplementor.h"

@implementation GBAImplementor

- (void)loadCommand:(EcommandType)command
{
    switch (command) {
        case EcommandTypeUp:
        {
            NSLog(@"GBA up");
        }
            break;
        case EcommandTypeDown:
        {
            NSLog(@"GBA down");
        }
            break;
        case EcommandTypeRight:
        {
            NSLog(@"GBA right");
        }
            break;
        case EcommandTypeLeft:
        {
            NSLog(@"GBA left");
        }
            break;
        case EcommandTypeA:
        {
            NSLog(@"GBA A");
        }
            break;
        case EcommandTypeB:
        {
            NSLog(@"GBA B");
        }
            break;
    }
}

@end
