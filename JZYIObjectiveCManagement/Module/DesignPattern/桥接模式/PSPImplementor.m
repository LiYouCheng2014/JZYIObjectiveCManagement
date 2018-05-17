//
//  PSPImplementor.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/17.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "PSPImplementor.h"

@implementation PSPImplementor

- (void)loadCommand:(EcommandType)command
{
    switch (command) {
        case EcommandTypeUp:
        {
            NSLog(@"PSP up");
        }
            break;
        case EcommandTypeDown:
        {
            NSLog(@"PSP down");
        }
            break;
        case EcommandTypeRight:
        {
            NSLog(@"PSP right");
        }
            break;
        case EcommandTypeLeft:
        {
            NSLog(@"PSP left");
        }
            break;
        case EcommandTypeA:
        {
            NSLog(@"PSP A");
        }
            break;
        case EcommandTypeB:
        {
            NSLog(@"PSP B");
        }
            break;
            
        case EcommandTypeX:
        {
            NSLog(@"PSP X");
        }
            break;
            
        case EcommandTypeO:
        {
            NSLog(@"PSP O");
        }
            break;
    }
}

@end
