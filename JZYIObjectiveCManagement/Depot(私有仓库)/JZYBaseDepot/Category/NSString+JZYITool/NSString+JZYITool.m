//
//  NSString+JZYITool.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "NSString+JZYITool.h"

@implementation NSString (JZYITool)

#pragma mrak - 计算大小

- (CGFloat)widthFont:(UIFont *)font height:(CGFloat)height
{
    return [self calculationTextSize:CGSizeMake(CGFLOAT_MAX, height)
                                font:font].width;
}

- (CGFloat)heightFont:(UIFont *)font width:(CGFloat)width
{
    return [self calculationTextSize:CGSizeMake(width, CGFLOAT_MAX)
                                font:font].height;
}

- (CGSize)calculationTextSize:(CGSize)size font:(UIFont *)font
{
    
    //NSStringDrawingUsesLineFragmentOrigin 整个文本将以每行组成的矩形为单位计算整个文本的尺寸
    //NSStringDrawingUsesFontLeading 使用字体的行间距来计算文本占用的范围，即每一行的底部到下一行的底部的距离计算
    //NSStringDrawingUsesDeviceMetrics 将文字以图像符号计算文本占用范围，而不是以字符计算。也即是以每一个字体所占用的空间来计算文本范围
    //NSStringDrawingTruncatesLastVisibleLine 当文本不能适合的放进指定的边界之内，则自动在最后一行添加省略符号。如果NSStringDrawingUsesLineFragmentOrigin没有设置，则该选项不生效
    
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading;
    
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    //    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
//    [paragraphStyle setLineSpacing:5.f];
    NSDictionary* attributes = @{ NSFontAttributeName:font,
                                 //                                 NSParagraphStyleAttributeName:paragraphStyle.copy,
//                                  NSParagraphStyleAttributeName:paragraphStyle
                                 };
    
    CGSize labelSize = [self boundingRectWithSize:size
                                          options:options
                                       attributes:attributes
                                          context:nil].size;
    
    return labelSize;
}

#pragma mark - 常用工具

- (void)callPhone
{
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@", self];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:str]]) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
}

@end
