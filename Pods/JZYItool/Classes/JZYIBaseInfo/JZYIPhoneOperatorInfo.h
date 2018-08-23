//
//  JZYIPhoneOperatorInfo.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZYIPhoneOperatorInfo : NSObject

/**
 得到当前手机所属运营商名称，如果没有则为nil
 
 @return 返回运营商名称
 */
+ (NSString *)getCurrentPhoneOperatorName;

/**
 得到当前手机号的国家代码,如果没有则为nil
 
 @return 返回国家代码
 */
+ (NSString *)getCurrentISOCountryCode;

/**
 得到移动国家码
 
 @return 返回移动国家码
 */
+ (NSString *)getMobileCountryCode;

@end
