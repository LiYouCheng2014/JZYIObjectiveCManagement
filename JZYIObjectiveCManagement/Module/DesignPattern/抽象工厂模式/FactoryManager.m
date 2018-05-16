//
//  FactoryManager.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "FactoryManager.h"

#import "AppleFactory.h"
#import "GoogleFactory.h"

@implementation FactoryManager

+ (BaseFactory *)factoryWithBrand:(EfactoryType)factoryType
{
    BaseFactory *factory = nil;
    
    if (factoryType == EfactoryTypeApple) {
        factory = [[AppleFactory alloc] init];
    }
    else if (factoryType == EfactoryTypeGoogle) {
        factory = [[GoogleFactory alloc] init];
    }
    return factory;
}

@end
