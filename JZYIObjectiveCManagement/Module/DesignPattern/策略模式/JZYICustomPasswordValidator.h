//
//  JZYICustomPasswordValidator.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/2.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYICustomInputValidator.h"

@interface JZYICustomPasswordValidator : JZYICustomInputValidator

/**
 重载父类方法
 
 @param input input description
 @return return value description
 */
- (BOOL)validateInput:(UITextField *)input;

@end
