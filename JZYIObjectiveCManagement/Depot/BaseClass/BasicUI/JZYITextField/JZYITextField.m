//
//  JZYITextField.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/26.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYITextField.h"

@implementation JZYITextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+ (instancetype)setupTextFieldWithFrame:(CGRect)frame
                                   font:(UIFont *)font
                              textColor:(UIColor *)textColor
                          textAlignment:(NSTextAlignment)textAlignment
                            placeholder:(NSString *)placeholder
                                   text:(NSString *)text
{
    JZYITextField *textField = [[JZYITextField alloc] init];
    textField.backgroundColor = [UIColor clearColor];
    textField.frame = frame;
    textField.font = font;
    textField.textColor = textColor;
    textField.textAlignment = textAlignment;
    textField.text = text;
    textField.placeholder = placeholder;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
}

+ (instancetype)setupTextFieldWithFont:(UIFont *)font
                             textColor:(UIColor *)textColor
                           placeholder:(NSString *)placeholder
                                  text:(NSString *)text
{
    return [JZYITextField setupTextFieldWithFrame:CGRectZero
                                             font:font
                                        textColor:textColor
                                    textAlignment:NSTextAlignmentLeft
                                      placeholder:placeholder
                                             text:text];
}

- (void)setupCornerRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
}

@end
