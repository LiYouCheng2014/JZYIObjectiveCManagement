//
//  FactoryManager.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseFactory.h"

typedef enum : NSUInteger {
    EfactoryTypeApple,
    EfactoryTypeGoogle
} EfactoryType;

@interface FactoryManager : NSObject

+ (BaseFactory *)factoryWithBrand:(EfactoryType)factoryType;

@end
