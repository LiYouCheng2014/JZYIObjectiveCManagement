//
//  CaculatorMaker.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "CaculatorMaker.h"

@implementation NSObject (Caculator)

+ (int)makeCaculators:(void(^)(CaculatorMaker *make))block
{
    //1.创建计算管理者
    CaculatorMaker *mgr = [[CaculatorMaker alloc] init];
    
    block(mgr);
    
    return mgr.result;
}

@end

@implementation CaculatorMaker

- (CaculatorMaker *(^)(int))add
{
    return ^CaculatorMaker *(int value) {
        _result += value;
        return self;
    };
}

- (CaculatorMaker *(^)(int))sub
{
    return ^CaculatorMaker *(int value) {
        _result -= value;
        return self;
    };
}

- (CaculatorMaker *(^)(int))muilt
{
    return ^CaculatorMaker *(int value) {
        _result *= value;
        return self;
    };
}

- (CaculatorMaker *(^)(int))divide
{
    return ^CaculatorMaker *(int value) {
        _result /= value;
        return self;
    };
}

@end
