//
//  JZYIButton.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/31.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZYIButton : UIButton

///注意titleArray,imageArray,backgroundImageArray 顺序为UIControlStateNormal,,UIControlStateSelected,UIControlStateDisabled,UIControlStateHighlighted
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
                        cornerRadius:(CGFloat)cornerRadius;

+ (instancetype)setupButtonWithFrame:(CGRect)frame
                                font:(UIFont *)font
                              target:(id)target
                              action:(SEL)sel;

///常用提交按钮 默认红底白字圆角JZYI_CORNER_RADIUS_3
+ (instancetype)setupSubmitButtonWithFrame:(CGRect)frame
                                    target:(id)target
                                    action:(SEL)sel
                                     title:(NSString *)title;

@end
