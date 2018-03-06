//
//  UIButton+JZYITool.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JZYITool)

#pragma mark - 扩大边界

/**
 扩大点击区域

 @param enlargedEdge 大小
 */
- (void)setEnlargedEdge:(CGFloat)enlargedEdge;


/**
 扩大按钮点击区域
 
 @param top 上
 @param left 左
 @param bottom 下
 @param right 右
 */
- (void)setEnlargedEdgeWithTop:(CGFloat)top
                          left:(CGFloat)left
                        bottom:(CGFloat)bottom
                         right:(CGFloat)right;

#pragma mark - 图片文字位置处理

/**
 图左文右,图片靠近左边
 
 @param space 图片与文字之间的空隙
 @param leftSpace 图片与左边之间的空隙
 */
- (void)setImageAndTitleRight:(CGFloat)space
                nearLeftSpace:(CGFloat)leftSpace;

/**
 图左文右,图片靠近右边
 
 @param space 图片与文字之间的空隙
 @param rightSpace 图片与左边之间的空隙
 */
- (void)setImageAndTitleRight:(CGFloat)space
               nearRightSpace:(CGFloat)rightSpace;

/**
 图左文右
 
 @param space 图片与文字间隙
 */
- (void)setImageAndTitleRight:(CGFloat)space;

/**
 图右文左
 
 @param space 图片与文字间隙
 */
- (void)setImageAndTitleLeft:(CGFloat)space;

/**
 图上文下
 
 @param space 图片与文字间隙
 */
- (void)setImageAndTitleBottom:(CGFloat)space;

/**
 图下文上
 
 @param space 图片与文字间隙
 */
- (void)setImageAndTitleTop:(CGFloat)space;

@end
