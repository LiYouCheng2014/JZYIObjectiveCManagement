//
//  UIButton+JZYIEnlarged.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "UIButton+JZYIEnlarged.h"

#import <objc/runtime.h>

static char topEdgeKey;
static char leftEdgeKey;
static char bottomEdgeKey;
static char rightEdgeKey;

@implementation UIButton (JZYIEnlarged)

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


@end
