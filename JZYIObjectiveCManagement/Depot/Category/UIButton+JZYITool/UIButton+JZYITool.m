//
//  UIButton+JZYITool.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "UIButton+JZYITool.h"

#import <objc/runtime.h>

//static const char *ObjectTagKey = "JZYIToolTagKey";

static char topEdgeKey;
static char leftEdgeKey;
static char bottomEdgeKey;
static char rightEdgeKey;

@implementation UIButton (JZYITool)

#pragma mark - 扩大边界

- (void)setEnlargedEdge:(CGFloat)enlargedEdge {
    [self setEnlargedEdgeWithTop:enlargedEdge left:enlargedEdge bottom:enlargedEdge right:enlargedEdge];
}

- (CGFloat)enlargedEdge {
    return [(NSNumber *)objc_getAssociatedObject(self, &topEdgeKey) floatValue];
}

- (void)setEnlargedEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right {
    objc_setAssociatedObject(self, &topEdgeKey,   [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftEdgeKey,  [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomEdgeKey,[NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightEdgeKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect {
    NSNumber *topEdge = objc_getAssociatedObject(self, &topEdgeKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftEdgeKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomEdgeKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightEdgeKey);
    
    if (topEdge && leftEdge && bottomEdge && rightEdge) {
        CGRect enlargedRect = CGRectMake(self.bounds.origin.x - leftEdge.floatValue, self.bounds.origin.y - topEdge.floatValue, CGRectGetWidth(self.frame) + leftEdge.floatValue + rightEdge.floatValue, CGRectGetHeight(self.frame) + topEdge.floatValue + bottomEdge.floatValue);
        return enlargedRect;
    }
    return self.bounds;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}

#pragma mark - 图片文字位置处理

- (void)setImageAndTitleRight:(CGFloat)space
                nearLeftSpace:(CGFloat)leftSpace
{
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0,leftSpace, 0.0,0.0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0,leftSpace + space, 0,0);
}

- (void)setImageAndTitleRight:(CGFloat)space
               nearRightSpace:(CGFloat)rightSpace
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
