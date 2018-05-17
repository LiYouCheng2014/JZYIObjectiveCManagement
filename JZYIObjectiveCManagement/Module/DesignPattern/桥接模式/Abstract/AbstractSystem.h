//
//  AbstractSystem.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/17.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AbstractImplementor.h"

@interface AbstractSystem : NSObject

//执行者
@property (nonatomic, strong) AbstractImplementor *implementor; //!< 注释

//加载系统
- (void)loadSystem;

- (void)command_up;
- (void)command_down;
- (void)command_right;
- (void)command_left;
- (void)command_a;
- (void)command_b;

@end
