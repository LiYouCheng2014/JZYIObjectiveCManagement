//
//  JZYIPasswordValidator.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/7.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIInputValidator.h"

@interface JZYIPasswordValidator : JZYIInputValidator
//字母和数字的组合
@property (nonatomic, assign) NSInteger maxDigit; //!< 最大位数
@property (nonatomic, assign) NSInteger minDigit; //!< 最小位数

/**
 *  重载了父类的验证方法
 */
- (BOOL)validateInput:(UITextField *)input;

@end
