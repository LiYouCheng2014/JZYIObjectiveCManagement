//
//  AbstractSystem.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/17.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "AbstractSystem.h"

@implementation AbstractSystem

- (void)loadSystem
{
    
}

- (void)command_up
{
    [self.implementor loadCommand:EcommandTypeUp];
    
}

- (void)command_down
{
    [self.implementor loadCommand:EcommandTypeDown];
    
}

- (void)command_right
{
    
    [self.implementor loadCommand:EcommandTypeRight];
}

- (void)command_left
{
    
    [self.implementor loadCommand:EcommandTypeLeft];
}

- (void)command_a
{
    [self.implementor loadCommand:EcommandTypeA];
    
}

- (void)command_b
{
    [self.implementor loadCommand:EcommandTypeB];
    
}

@end
