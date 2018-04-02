//
//  JZYICustomPhoneValidator.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/2.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYICustomPhoneValidator.h"

@implementation JZYICustomPhoneValidator

- (BOOL)validateInput:(UITextField *)input
{
    if ([input.text length] > 0) {
        self.errorMessage = nil;
    }
    else {
        self.errorMessage = @"请输入电话号码";
    }
    return self.errorMessage == nil ? true : false;
}

@end
