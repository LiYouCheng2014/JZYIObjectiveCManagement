//
//  JZYITextField.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/2.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JZYICustomInputValidator.h"

@interface JZYICustomTextField : UITextField

//抽象的策略
@property (nonatomic, strong) JZYICustomInputValidator *inputValidator;

//验证输入是否合法
- (BOOL)validate;


@end
