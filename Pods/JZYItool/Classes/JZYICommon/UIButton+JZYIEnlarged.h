//
//  UIButton+JZYIEnlarged.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JZYIEnlarged)

#pragma mark - 扩大边界

/**
 扩大点击区域

 @param enlargedEdge 边界
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

@end
