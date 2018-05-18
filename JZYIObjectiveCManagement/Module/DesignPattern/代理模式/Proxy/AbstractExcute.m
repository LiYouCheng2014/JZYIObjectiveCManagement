//
//  AbstractExcute.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/18.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "AbstractExcute.h"

@implementation AbstractExcute

+ (instancetype)shareInstance {
    static AbstractExcute *excute = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        excute = [[AbstractExcute alloc] init];
    });
    return excute;
}

- (void)nullExcute:(NSArray *)infos{
    NSLog(@"infos = %@",infos);
}

@end
