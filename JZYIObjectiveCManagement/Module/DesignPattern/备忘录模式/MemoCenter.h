//
//  MemoCenter.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MemoCenterProtocol.h"

@interface MemoCenter : NSObject

//存储对象状态
+ (void)saveMemoObject:(id <MemoCenterProtocol>)Object withKey:(NSString *)key;

//获取对象状态
+ (id)memoObjectWithKey:(NSString *)key;

@end
