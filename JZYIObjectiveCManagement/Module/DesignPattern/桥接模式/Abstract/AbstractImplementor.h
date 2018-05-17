//
//  AbstractImplementor.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/17.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    EcommandTypeUp,
    EcommandTypeDown,
    EcommandTypeRight,
    EcommandTypeLeft,
    
    EcommandTypeA,
    EcommandTypeB,
    
    EcommandTypeX,
    EcommandTypeO
} EcommandType;

@interface AbstractImplementor : NSObject

//执行命令
- (void)loadCommand:(EcommandType)command;

@end
