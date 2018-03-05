//
//  JZYITextField.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/26.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZYITextField : UITextField

+ (instancetype)setupTextFieldWithFrame:(CGRect)frame
                                   font:(UIFont *)font
                              textColor:(UIColor *)textColor
                          textAlignment:(NSTextAlignment)textAlignment
                            placeholder:(NSString *)placeholder
                                   text:(NSString *)text;

///推荐使用
+ (instancetype)setupTextFieldWithFont:(UIFont *)font
                             textColor:(UIColor *)textColor
                           placeholder:(NSString *)placeholder
                                  text:(NSString *)text;

/**
 设置圆角
 
 @param radius 圆角
 */
- (void)setupCornerRadius:(CGFloat)radius;

@end
