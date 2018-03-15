//
//  JZYISystemPromptManagement.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/27.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^JZYIClickAtIndexBlock)(NSInteger buttonIndex);

@interface JZYISystemPromptManagement : NSObject

/**
 UIAlertView弹框提示封装
 
 @param title 标题
 @param message 信息
 @param cancelButtonTitle 取消按钮
 @param otherButtons 其它按钮数组
 @param clickAtIndex 点击事件块 取消0 其它倒序
 */
+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *)otherButtons
                  clickAtIndex:(JZYIClickAtIndexBlock)clickAtIndex;

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
                 clickAtIndex:(JZYIClickAtIndexBlock)clickAtIndex;

@end
