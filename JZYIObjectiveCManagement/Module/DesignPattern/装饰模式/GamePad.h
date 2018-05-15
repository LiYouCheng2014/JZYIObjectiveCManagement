//
//  GamePad.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/15.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GamePad : NSObject


/**
 上下左右
 */
- (void)up;
- (void)down;
- (void)left;
- (void)right;


/**
 选择与开始
 */
- (void)select;
- (void)start;


/**
 按钮A+B+X+Y
 */
- (void)commandA;
- (void)commandB;
- (void)commandX;
- (void)commandY;

@end
