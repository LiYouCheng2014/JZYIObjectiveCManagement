//
//  JZYICustomInputValidator.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/2.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZYICustomInputValidator : NSObject


- (BOOL)validateInput:(UITextField *)input;


/**
 当validateInput为NO的时候，我们来读取错误信息
 */
@property (nonatomic, strong) NSString *errorMessage;

@end
