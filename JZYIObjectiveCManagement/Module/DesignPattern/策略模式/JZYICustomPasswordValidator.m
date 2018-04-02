//
//  JZYICustomPasswordValidator.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/2.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYICustomPasswordValidator.h"

@implementation JZYICustomPasswordValidator

- (BOOL)validateInput:(UITextField *)input
{
    if ([input.text length] > 0) {
        self.errorMessage = nil;
    }
    else {
        self.errorMessage = @"请输入密码";
    }
    return self.errorMessage == nil ? true : false;
}

@end
