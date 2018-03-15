//
//  NSString+JZYITool.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSString (JZYITool)

#pragma mrak - 计算大小

/**
 *  返回某段文本的宽度
 *
 *  @param font   字体大小
 *  @param height 固定高度
 *
 *  @return 所需宽度
 */
- (CGFloat)widthFont:(UIFont *)font height:(CGFloat)height;

/**
 *  返回某段文本的高度
 *
 *  @param font   字体大小
 *  @param width  固定宽度
 *
 *  @return 所需高度
 */
- (CGFloat)heightFont:(UIFont *)font width:(CGFloat)width;

/**
 计算文字大小
 
 @param size 宽高限制
 @param font 字体大小
 @return 返回计算后的文字大小
 */
- (CGSize)calculationTextSize:(CGSize)size font:(UIFont *)font;

#pragma mark - 常用工具

/**
 拨打电话
 */
- (void)callPhone;

@end
