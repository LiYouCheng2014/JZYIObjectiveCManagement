//
//  NSString+JZYITool.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

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

#pragma mark -

/**
 拨打电话
 */
- (void)callPhone;

#pragma mark - 转换

/**
 NSInteger转字符串
 
 @param i 整形
 @return 字符串
 */
+ (NSString *)integerToString:(NSInteger)i;

/**
 NSUInteger转字符串
 
 @param i 整形
 @return 字符串
 */
+ (NSString *)uIntegerToString:(NSUInteger)i;

/**
 汉字转拼音
 
 @return 对应拼音 不带音标
 */
- (NSString *)transformSpell;

/**
 json转字典

 @return 字典
 */
- (NSDictionary *)jzyiObjectFromJSONStringWithParseOptions;

@end
