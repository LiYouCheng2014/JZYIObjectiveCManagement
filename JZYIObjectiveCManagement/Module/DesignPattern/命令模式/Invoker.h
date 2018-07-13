//
//  Invoker.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommandProtocol.h"

@interface Invoker : NSObject

+ (instancetype)shareInstance;

//回退
- (void)rollBack;

//添加指令并执行
- (void)addAndExcute:(id <CommandProtocol>)command;

@end
