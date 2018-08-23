//
//  JZYIPromptManagement.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/30.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZYIPromptManagement : NSObject

/**
 显示成功信息

 @param message 提示信息
 */
+ (void)showSuccessWithStatus:(NSString *)message;

/**
 显示失败信息
 
 @param message 提示信息
 */
+ (void)showErrorWithStatus:(NSString *)message;

/**
 显示信息
 
 @param message 提示信息
 */
+ (void)showInfoWithStatus:(NSString *)message;

@end
