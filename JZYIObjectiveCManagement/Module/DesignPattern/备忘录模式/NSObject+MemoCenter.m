//
//  NSObject+MemoCenter.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "NSObject+MemoCenter.h"

#import "MemoCenter.h"

@implementation NSObject (MemoCenter)

- (void)saveStateWithKey:(NSString *)key
{
    //非空处理
    id <MemoCenterProtocol> obj = (id <MemoCenterProtocol>)self;
    if ([obj respondsToSelector:@selector(currentState)]) {
        [MemoCenter saveMemoObject:obj withKey:key];
    }
}

- (void)recoverFromStateWithKey:(NSString *)key
{
    //非空处理
    id state = [MemoCenter memoObjectWithKey:key];
    id <MemoCenterProtocol> obj = (id <MemoCenterProtocol>)self;
    if ([obj respondsToSelector:@selector(recoverFromState:)]) {
        [obj recoverFromState:state];
    }
}

@end
