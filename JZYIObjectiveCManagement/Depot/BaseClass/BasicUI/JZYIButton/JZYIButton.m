//
//  JZYIButton.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/31.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIButton.h"

//#import "JZYICategory.h"

@implementation JZYIButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setExclusiveTouch:YES];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setExclusiveTouch:YES];
    }
    return self;
}

+ (instancetype)setupButtonWithFrame:(CGRect)frame
                                font:(UIFont *)font
                          textColors:(NSArray <UIColor *>*)textColorArray
                              titles:(NSArray <NSString *>*)titleArray
                              images:(NSArray <UIImage *>*)imageArray
                    backgroundImages:(NSArray <UIImage *>*)backgroundImageArray
                              target:(id)target
                              action:(SEL)sel
                         borderWidth:(CGFloat)borderWidth
                         borderColor:(UIColor *)borderColor
                        cornerRadius:(CGFloat)cornerRadius
{
    JZYIButton *button = [[JZYIButton alloc] init];
    button.backgroundColor = [UIColor clearColor];
    button.frame = frame;
    button.titleLabel.font = font;
    
//    if (textColorArray) {
//        [button setTitleColor:[JZYIButton getColor:textColorArray index:0] forState:UIControlStateNormal];
//        [button setTitleColor:[JZYIButton getColor:textColorArray index:1] forState:UIControlStateSelected];
//        [button setTitleColor:[JZYIButton getColor:textColorArray index:2] forState:UIControlStateDisabled];
//        [button setTitleColor:[JZYIButton getColor:textColorArray index:3] forState:UIControlStateHighlighted];
//    }
//
//    if (titleArray) {
//        [button setTitle:[JZYIButton getTitle:titleArray index:0] forState:UIControlStateNormal];
//        [button setTitle:[JZYIButton getTitle:titleArray index:1] forState:UIControlStateSelected];
//        [button setTitle:[JZYIButton getTitle:titleArray index:2] forState:UIControlStateDisabled];
//        [button setTitle:[JZYIButton getTitle:titleArray index:3] forState:UIControlStateHighlighted];
//    }
//
//    if (imageArray) {
//        [button setImage:[JZYIButton getImage:imageArray index:0] forState:UIControlStateNormal];
//        [button setImage:[JZYIButton getImage:imageArray index:1] forState:UIControlStateSelected];
//        [button setImage:[JZYIButton getImage:imageArray index:2] forState:UIControlStateDisabled];
//        [button setImage:[JZYIButton getImage:imageArray index:3] forState:UIControlStateHighlighted];
//    }
    
//    if (backgroundImageArray) {
//        [button setBackgroundImage:[JZYIButton getImage:backgroundImageArray index:0] forState:UIControlStateNormal];
//        [button setBackgroundImage:[JZYIButton getImage:backgroundImageArray index:1] forState:UIControlStateSelected];
//        [button setBackgroundImage:[JZYIButton getImage:backgroundImageArray index:2] forState:UIControlStateDisabled];
//        [button setBackgroundImage:[JZYIButton getImage:backgroundImageArray index:3] forState:UIControlStateHighlighted];
//    }
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    
//    [button jzyiSetViewBorderWidth:borderWidth
//                       borderColor:borderColor
//                      cornerRadius:cornerRadius];
//    [button jzyiSetBackgroundColor:[UIColor clearColor]];

    return button;
}

+ (instancetype)setupButtonWithFrame:(CGRect)frame
                                font:(UIFont *)font
                              target:(id)target
                              action:(SEL)sel
{
    JZYIButton *button = [[JZYIButton alloc] init];
    button.backgroundColor = [UIColor clearColor];
    button.frame = frame;
    button.titleLabel.font = font;
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

//+ (instancetype)setupSubmitButtonWithFrame:(CGRect)frame
//                                    target:(id)target
//                                    action:(SEL)sel
//                                     title:(NSString *)title
//{
//
////    JZYIButton *button = [JZYIButton setupButtonWithFrame:frame
////                                                     font:[UIFont fontFor36]
////                                               textColors:@[ [UIColor whiteColor],[NSNull null],[UIColor whiteColor] ]
////                                                   titles:@[ title ]
////                                                   images:nil
////                                         backgroundImages:@[ [UIImage imageWithColor:[UIColor colorForButtonRed]],[UIImage imageWithColor:[UIColor colorForButtonGray]] ]
////                                                   target:target
////                                                   action:sel
////                                              borderWidth:0
////                                              borderColor:nil
////                                             cornerRadius:3];
////    button.backgroundColor = [UIColor colorForButtonRed];
////    button.imageView =
//    return button;
//}

- (void)jzyiSetBackgroundImage:(UIImage *)image forState:(UIControlState )state
{
    [self setBackgroundImage:image forState:state];
}

- (void)jzyiSetTitleColor:(UIColor *)color forState:(UIControlState )state
{
    [self setTitleColor:color forState:state];
}

- (void)jzyiSetTitle:(NSString *)title forState:(UIControlState )state
{
    [self setTitle:title forState:state];
}

- (void)jzyiSetTarget:(id)target action:(SEL)sel forControlEvents:(UIControlEvents)event
{
    [self addTarget:target action:sel forControlEvents:event];
}


+ (UIColor *)getColor:(NSArray *)array index:(NSInteger)index
{
    if (index < array.count) {
        if ([array[index] isKindOfClass:[UIColor class]]) {
            return array[index];
        }
        else {
            return nil;
        }
    }
    else {
        return nil;
    }
}

+ (UIImage *)getImage:(NSArray *)array index:(NSInteger)index
{
    if (index < array.count) {
        if ([array[index] isKindOfClass:[UIImage class]]) {
            return array[index];
        }
        else {
            return nil;
        }
    }
    else {
        return nil;
    }
}

+ (NSString *)getTitle:(NSArray *)array index:(NSInteger)index
{
    if (index < array.count) {
        if ([array[index] isKindOfClass:[NSString class]]) {
            return array[index];
        }
        else {
            return nil;
        }
    }
    else {
        return nil;
    }
}

@end
