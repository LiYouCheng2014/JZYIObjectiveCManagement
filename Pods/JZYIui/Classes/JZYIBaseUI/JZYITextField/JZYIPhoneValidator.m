//
//  JZYIPhoneValidator.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/7.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIPhoneValidator.h"

@implementation JZYIPhoneValidator

- (BOOL)validateInput:(UITextField *)input {
    
    if (input.text.length <= 0) {
        
        self.errorMessage = @"没有输入手机号";
        
    } else {
        
        BOOL isMatch = [self isPhone:input.text];
        if (isMatch == NO) {
            
            self.errorMessage = @"请输入正确的手机号码";
            
        } else {
            
            self.errorMessage = nil;
        }
    }
    
    return self.errorMessage == nil ? YES : NO;
}

- (BOOL)isPhone:(NSString *)phone
{
    NSString *phoneRegex = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9]|9[89]|6[6])\\d{8}$";
    return [self jzyiEvaluateWithPredicate:phoneRegex phone:phone];
}

- (BOOL)jzyiEvaluateWithPredicate:(NSString *)regex phone:(NSString *)phone
{
    if (phone && [phone length] > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [predicate evaluateWithObject:phone];
    }
    return false;
}

@end
