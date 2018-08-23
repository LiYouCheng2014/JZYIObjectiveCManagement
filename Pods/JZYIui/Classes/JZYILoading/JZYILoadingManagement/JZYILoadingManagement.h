//
//  JZYILoadingManagement.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/10.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JZYILoadingManagement : NSObject

/**
 显示加载动画
 
 @param view 承载
 */
+ (void)showLoadingView:(UIView *)view;

/**
 隐藏加载动画

 @param view 承载
 */
+ (void)hideLoadingView:(UIView *)view;
@end
