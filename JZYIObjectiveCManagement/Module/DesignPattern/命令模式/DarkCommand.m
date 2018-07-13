//
//  DarkCommand.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "DarkCommand.h"
@interface DarkCommand ()

@property (nonatomic, weak) Receiver *receiver; //!<
@property (nonatomic, assign) CGFloat parameter; //!<

@end

@implementation DarkCommand

//与接收器绑定并设置参数
- (instancetype)initWithReceive:(Receiver *)receiver paramter:(CGFloat)paramter
{
    self = [super init];
    if (self) {
        self.receiver = receiver;
        self.parameter = paramter;
    }
    return self;
}

//命令的执行
- (void)excute
{
    [self.receiver makeDarker:self.parameter];
}

//撤销
- (void)rollBackExcute
{
    [self.receiver  makeLighter:self.parameter];
}

@end
