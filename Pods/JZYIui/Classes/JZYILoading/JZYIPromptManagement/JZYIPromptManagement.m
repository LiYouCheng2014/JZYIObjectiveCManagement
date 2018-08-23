//
//  JZYIPromptManagement.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/30.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIPromptManagement.h"

#import <SVProgressHUD/SVProgressHUD.h>

static NSString *kErrorMessage = @"温馨提示";

@implementation JZYIPromptManagement

+ (void)showSuccessWithStatus:(NSString *)message
{
    [JZYIPromptManagement defaultSet];
    if (!message) {
        return;
    }
    [SVProgressHUD showSuccessWithStatus:message ? message : kErrorMessage];
}

+ (void)showErrorWithStatus:(NSString *)message
{
    [JZYIPromptManagement defaultSet];
    if (!message) {
        return;
    }
    [SVProgressHUD showErrorWithStatus:message ? message : kErrorMessage];
}

+ (void)showInfoWithStatus:(NSString *)message
{
    [JZYIPromptManagement defaultSet];
    if (!message) {
        return;
    }
    [SVProgressHUD showInfoWithStatus:message ? message : kErrorMessage];
}

+ (void)defaultSet
{
    [SVProgressHUD setMinimumDismissTimeInterval:2.f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setMinimumSize:CGSizeMake(100, 60)];
    
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
}


@end
