//
//  Builder.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "Builder.h"

@implementation Builder

- (id)builderAll
{
    Builder *builder = [[[self class] alloc] init];
    [builder.partOne build];
    [builder.partTwo build];
    
    return builder;
}

@end
