//
//  UIButton+JZYITool.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "UIButton+JZYITool.h"

@implementation UIButton (JZYITool)

#pragma mark - 图片文字位置处理

- (void)setImageAndTitleRight:(CGFloat)space
                NearLeftSpace:(CGFloat)leftSpace
{
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0,leftSpace, 0.0,0.0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0,leftSpace + space, 0,0);
}

- (void)setImageAndTitleRight:(CGFloat)space
               NearRightSpace:(CGFloat)rightSpace
{
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0,0, 0.0,rightSpace + space);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0,0, 0,rightSpace);
}

- (void)setImageAndTitleRight:(CGFloat)space
{
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0,0.0, 0.0,space);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, space, 0, 0.0);
}

- (void)setImageAndTitleLeft:(CGFloat)space
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0,titleSize.width + space, 0.0,-titleSize.width - space);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, 0, imageSize.width + space);
}

- (void)setImageAndTitleBottom:(CGFloat)space
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    //    self.imageView.backgroundColor = [UIColor greenColor];
    //    self.titleLabel.backgroundColor = [UIColor redColor];
    //    NSLog(@"image w = %f,height = %f",imageSize.width,imageSize.height);
    //    NSLog(@"title w = %f,height = %f",titleSize.width,titleSize.height);
    //
    self.imageEdgeInsets = UIEdgeInsetsMake( - (titleSize.height + space), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake( 0.0, - imageSize.width, - (imageSize.height + space), 0.0);
    
}

- (void)setImageAndTitleTop:(CGFloat)space
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    self.imageEdgeInsets = UIEdgeInsetsMake( 0.0, 0.0, -(titleSize.height + space), - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake( - (imageSize.height + space), - imageSize.width, 0.0, 0.0);
}

@end
