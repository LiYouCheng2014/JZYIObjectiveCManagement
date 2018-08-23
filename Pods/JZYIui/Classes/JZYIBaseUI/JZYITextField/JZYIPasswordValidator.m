//
//  JZYIPasswordNumberValidator.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/7.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIPasswordValidator.h"

@implementation JZYIPasswordValidator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.maxDigit = 16;
        self.minDigit = 6;
    }
    return self;
}

- (BOOL)validateInput:(UITextField *)input {
    
    if (input.text.length <= 0) {
        
        self.errorMessage = @"没有输入密码";
        
    } else {
        
        BOOL isMatch = [self isPassword:input.text];
        if (isMatch == NO) {
            
            self.errorMessage = [NSString stringWithFormat:@"请输入%ld-%ld位的数字或字母的密码",(long)self.minDigit,(long)self.maxDigit];
            
        } else {
            
            self.errorMessage = nil;
        }
    }
    
    return self.errorMessage == nil ? YES : NO;
}

- (BOOL)isPassword:(NSString *)password
{
    NSString *passwordRegex = [NSString stringWithFormat:@"^[a-zA-Z\\d]{%ld,%ld}$",(long)self.minDigit,(long)self.maxDigit];
    return [self jzyiEvaluateWithPredicate:passwordRegex password:password];
}

- (BOOL)jzyiEvaluateWithPredicate:(NSString *)regex password:(NSString *)password
{
    if (password && [password length] > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [predicate evaluateWithObject:password];
    }
    return false;
}

@end
