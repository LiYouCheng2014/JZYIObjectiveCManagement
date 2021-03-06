//
//  FadeAnimationView.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/21.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "FadeAnimationView.h"

@implementation FadeAnimationView

//依赖倒转原则
- (void)fadeAnimated:(BOOL)animated
{
    //to do
}

/**
 切换到正常状态
 
 @param animated 是否执行动画
 @param duration 动画持续时间
 */
- (void)changeToNormalStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration
{
    //to do
    [self fadeAnimated:animated];
}

/**
 切换到禁止状态
 
 @param animated 是否执行动画
 @param duration 动画持续时间
 */
- (void)changeToDisableStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration
{
    //to do
}

/**
 切换到高亮状态
 
 @param animated 是否执行动画
 @param duration 动画持续时间
 */
- (void)changeToHighlightStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration
{
    //to do
}

@end
