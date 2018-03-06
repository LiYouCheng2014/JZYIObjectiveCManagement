//
//  JZYIBaseNavigationVC.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZYIBaseNavigationVC : UIViewController

/**
 点击左边
 */
- (void)clickedNavLeft;

/**
 点击右边
 */
- (void)clickedNavRight;


/**
 返回到指定VC
 
 @param vc 指定控制器
 */
- (void)backToVC:(UIViewController *)vc;

/**
 返回指定序号 从当前界面往前推
 
 @param index 当前界面为0
 */
- (void)backToIndex:(NSInteger)index;


/**
 导航条左边按钮
 
 @param title 文字
 */
- (void)setupLeftButtonTitle:(NSString *)title;

/**
 导航条左边按钮
 
 @param title 文字
 @param color 颜色
 */
- (void)setupLeftButtonTitle:(NSString *)title textColor:(UIColor *)color;

/**
 导航条右边按钮
 
 @param title 文字
 */
- (void)setupRightButtonTitle:(NSString *)title;

/**
 导航条右边按钮
 
 @param title 文字
 @param color 颜色
 */
- (void)setupRightButtonTitle:(NSString *)title textColor:(UIColor *)color;

/**
 导航条右边按钮
 
 @param image 图片
 */
- (void)setupRightButtonImage:(UIImage *)image;

/**
 设置标题
 
 @param title 标题
 */
- (void)setupNavTitle:(NSString *)title;

/**
 清除左边view
 */
- (void)setupLeftViewClear;

/**
 清除右边view
 */
- (void)setupRightViewClear;

/**
 清除中间view
 */
- (void)setupTitleViewClear;

/**
 隐藏底部线
 */
- (void)hideNavBottomLine;

/**
 自定义导航条左边
 
 @param view view description
 */
- (void)setupLeftView:(UIView *)view;

/**
 自定义导航条右边
 
 @param view view description
 */
- (void)setupRightView:(UIView *)view;

/**
 自定义导航条中间
 
 @param view view description
 */
- (void)setupTitleView:(UIView *)view;

@end
