//
//  MemoCenterProtocol.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MemoCenterProtocol <NSObject>

@required
//获取状态
- (id)currentState;

//恢复 从状态
- (void)recoverFromState:(id)state;

@end
