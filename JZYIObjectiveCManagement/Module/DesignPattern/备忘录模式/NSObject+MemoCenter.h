//
//  NSObject+MemoCenter.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MemoCenter)

//保存状态
- (void)saveStateWithKey:(NSString *)key;
//恢复状态
- (void)recoverFromStateWithKey:(NSString *)key;
@end
