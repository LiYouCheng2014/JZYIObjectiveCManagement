//
//  DarkCommand.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommandProtocol.h"

@interface DarkCommand : NSObject <CommandProtocol>

//与接收器绑定并设置参数
- (instancetype)initWithReceive:(Receiver *)receiver paramter:(CGFloat)paramter;

@end
