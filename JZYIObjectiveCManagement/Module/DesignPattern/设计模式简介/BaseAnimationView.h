//
//  BaseAnimationView.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/21.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseAnimationView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSAttributedString *attributedTitle;

/**
 切换到正常状态

 @param animated 是否执行动画
 @param duration 动画持续时间
 */
- (void)changeToNormalStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;

//接口隔离原则 
/**
 切换到禁止状态
 
 @param animated 是否执行动画
 @param duration 动画持续时间
 */
- (void)changeToDisableStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;


/**
 切换到高亮状态
 
 @param animated 是否执行动画
 @param duration 动画持续时间
 */
- (void)changeToHighlightStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;

@end
