//
//  UIButton+JZYITool.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JZYITool)


#pragma mark - 图片文字位置处理

/**
 图左文右,图片靠近左边
 
 @param space 图片与文字之间的空隙
 @param leftSpace 图片与左边之间的空隙
 */
- (void)setImageAndTitleRight:(CGFloat)space
                NearLeftSpace:(CGFloat)leftSpace;

/**
 图左文右,图片靠近右边
 
 @param space 图片与文字之间的空隙
 @param rightSpace 图片与左边之间的空隙
 */

- (void)setImageAndTitleRight:(CGFloat)space
               NearRightSpace:(CGFloat)rightSpace;

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
