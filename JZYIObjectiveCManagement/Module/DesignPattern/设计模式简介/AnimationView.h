//
//  AnimationView.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/21.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FadeAnimationView.h"

@interface AnimationView : UIView

@property (nonatomic, strong) FadeAnimationView *fadeAnimationView;

//合成/聚合复用
/**
 切换到出错状态
 
 @param animated 是否执行动画
 @param duration 动画持续时间
 */
- (void)changeToErrorStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;

@end
