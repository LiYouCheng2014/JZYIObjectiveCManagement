//
//  MemoCenter.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "MemoCenter.h"

#include <FastCoder.h>

@implementation MemoCenter

//存储对象状态
+ (void)saveMemoObject:(id <MemoCenterProtocol>)object withKey:(NSString *)key
{
    NSParameterAssert(object);
    NSParameterAssert(key);
    //获取data
    id data = [object currentState];
    
    NSData *tempData = [FastCoder dataWithRootObject:data];
    //进行存储
    if (tempData) {
        [[NSUserDefaults standardUserDefaults] setObject:tempData forKey:key];
    }
}

//获取对象状态
+ (id)memoObjectWithKey:(NSString *)key
{
    NSParameterAssert(key);
    
    id data = nil;
    
    NSData *tempData = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    //获取值
    if (tempData) {
        data = [FastCoder objectWithData:tempData];
    }
    
    return data;
}

@end
