//
//  JZYIUiInfo.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JZYIUiInfo : NSObject

/**
 导航条高度
 
 @return 当前高度
 */
+ (CGFloat)getNavigationHeight;

/**
 状态栏高度
 
 @return 当前高度
 */
+ (CGFloat)getStatusBarHeight;

/**
 安区域高度
 
 @return 当前高度
 */
+ (CGFloat)getSafeHeight;

/**
 状态栏加导航条高度
 
 @return 当前高度
 */
+ (CGFloat)getTopHeight;

/**
 标签栏高度
 
 @return 当前高度
 */
+ (CGFloat)getTabbarHeight;

/**
 顶部间距
 
 @return 间距
 */
+ (CGFloat)getTopSpacing;

/**
 左边间距
 
 @return 间距
 */
+ (CGFloat)getLeftSpacing;

/**
 下部间距
 
 @return 间距
 */
+ (CGFloat)getBottomSpacing;

/**
 右边间距

 @return 间距
 */
+ (CGFloat)getRightSpacing;

/**
 线宽度

 @return 当前线宽
 */
+ (CGFloat)getLineWidth;

/**
 垂直间距

 @return 间距
 */
+ (CGFloat)getVerticalSpacing;

/**
 水平间距
 
 @return 间距
 */
+ (CGFloat)getHorizontalSpacing;

/**
 圆角
 
 @return 大小
 */
+ (CGFloat)getCornerRadius;

@end
