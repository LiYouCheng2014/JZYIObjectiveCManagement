//
//  JZYISystemPromptManager.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/27.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYISystemPromptManagement.h"
#import <UIKit/UIKit.h>

//类方法中的对象被持有
static JZYIClickAtIndexBlock _clickAtIndexBlock;

@interface JZYISystemPromptManagement ()
<UIAlertViewDelegate,
UIActionSheetDelegate>

@end

@implementation JZYISystemPromptManagement

/**
 UIAlertView使用封装
 
 @param title 标题
 @param message 信息
 @param cancelButtonTitle 取消按钮
 @param otherButtons 其它按钮数组
 @param clickAtIndex 点击事件块 取消0，其它倒序
 */
+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *)otherButtons
                  clickAtIndex:(JZYIClickAtIndexBlock)clickAtIndex {
    _clickAtIndexBlock = [clickAtIndex copy];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    // 添加按钮
    if (cancelButtonTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            _clickAtIndexBlock(0);
        }];
        [alertController addAction:cancelAction];
    }
    
    NSInteger index = 1;
    for (NSString *buttonTitle in otherButtons) {
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            _clickAtIndexBlock(index);
        }];
        [alertController addAction:otherAction];
        
        index += 1;
    }
    
    UIViewController *vc = (UIViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if (vc.presentedViewController) {
        
        [vc.presentedViewController presentViewController:alertController animated:YES completion:nil];
    }
    else {
        
        [vc presentViewController:alertController animated:YES completion:nil];
    }
}

/**
 UIActionSheet使用封装
 
 @param view 加载view，针对iOS8以上就不起作用
 @param title 标题
 @param cancelButtonTitle 取消按钮
 @param destructiveButton 目标按钮
 @param otherButtons 其它按钮数组
 @param clickAtIndex 点击事件块 取消0，目的1，其它倒序
 */
+ (void)showActionSheetInView:(UIView *)view
                    withTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButton
            otherButtonTitles:(NSArray *)otherButtons
                 clickAtIndex:(JZYIClickAtIndexBlock)clickAtIndex {
    
    _clickAtIndexBlock = [clickAtIndex copy];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    // 添加按钮
    if (cancelButtonTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            _clickAtIndexBlock(0);
        }];
        [alertController addAction:cancelAction];
    }
    
    if (destructiveButton) {
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButton style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            _clickAtIndexBlock(1);
        }];
        [alertController addAction:destructiveAction];
    }
    
    
    NSInteger index = 2;
    for (NSString *buttonTitle in otherButtons) {
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            _clickAtIndexBlock(index);
        }];
        [alertController addAction:otherAction];
        
        index += 1;
    }
    
    UIViewController *vc = (UIViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [vc presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - UIAlertViewDelegate

+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (_clickAtIndexBlock) {
        _clickAtIndexBlock(buttonIndex);
    }
}

+ (void)alertView:(UIAlertView*)alertView didDismissWithButtonIndex:(NSInteger) buttonIndex {
    
    if (_clickAtIndexBlock) {
        _clickAtIndexBlock = nil;
    }
}

#pragma mark - UIActionSheetDelegate

+ (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (_clickAtIndexBlock) {
        _clickAtIndexBlock(buttonIndex);
    }
}

+ (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (_clickAtIndexBlock) {
        _clickAtIndexBlock = nil;
    }
}

@end
