//
//  JZYIPhoneValidator.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/7.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIInputValidator.h"

@interface JZYIPhoneValidator : JZYIInputValidator

/**
 *  重载了父类的验证方法
 */
- (BOOL)validateInput:(UITextField *)input;

@end
