//
//  Invoker.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "Invoker.h"

@interface Invoker ()

@property (nonatomic, strong) NSMutableArray *queue; //!<

@end

@implementation Invoker

+ (instancetype)shareInstance {
    static Invoker *shareInstanceValue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstanceValue = [[Invoker alloc] init];
        
        shareInstanceValue.queue = [NSMutableArray array];
    });
    
    return shareInstanceValue;
}

- (void)rollBack {
    id <CommandProtocol> command = self.queue.lastObject;
    [command rollBackExcute];
    
    [self.queue removeLastObject];
}

- (void)addAndExcute:(id <CommandProtocol>)command {
    NSParameterAssert(command);
    [self.queue addObject:command];
    
    [command excute];
}



@end
