//
//  NSString+JZYIRegex.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JZYIRegex)

/**
 正则表达式判断
 
 @param regex 正则表达式
 @return 验证结果
 */
- (BOOL)jzyiEvaluateWithPredicate:(NSString *)regex;

/**
 是否手机号11位数字
 
 @return 验证结果
 */
- (BOOL)validateMobilePhoneNo;

/**
 是否手机号
 
 @return 验证结果
 */
- (BOOL)validateMobilePhoneNoClassification;

/**
 是否固定电话
 
 @return 验证结果
 */
- (BOOL)validatePhoneNo;


/**
 是否邮箱
 
 @return 验证结果
 */
- (BOOL)validateEmail;

/**
 是否数字
 
 @return 验证结果
 */
- (BOOL)validateNumber;

/**
 是否指定数字长度
 
 @return 验证结果
 */
- (BOOL)validateNumberWithLength:(NSInteger)length;

/**
 是否URL
 
 @return 验证结果
 */
- (BOOL)validateURL;

/**
 是否车牌号
 
 @return 验证结果
 */
- (BOOL)validateCarNo;

/**
 是否车牌类型
 
 @return 验证结果
 */
- (BOOL)validateCarType;

/**
 是否有特殊符号
 
 @return 验证结果
 */
- (BOOL)validateEffectivePassword;

/**
 是否身份证
 
 @return 验证结果
 */
- (BOOL)validateIdentityCard;

/**
 是否用户名
 
 @return 验证结果
 */
- (BOOL)validateUserName;

/**
 是否昵称
 
 @return 验证结果
 */
- (BOOL)validateNickName;

/**
 是否小写
 
 @return 验证结果
 */
- (BOOL)validateLowercaseLetter;

/**
 是否大写
 
 @return 验证结果
 */
- (BOOL)validateUppercaseLetter;

/**
 是否有效密码
 
 @param regex 密码正则表达式 默认（6-16位数字或字母)
 @return 验证结果
 */
- (BOOL)validatePasswordWithRegex:(NSString *)regex;

/**
 是否IP地址
 
 @return 验证结果
 */
- (BOOL)validateIPAddress;

/**
 是否Mac地址
 
 @return 验证结果
 */
- (BOOL)validateMacAddress;

/**
 是否纯汉字
 
 @return 验证结果
 */
- (BOOL)validateValidChinese;

/**
 是否邮政编码
 
 @return 验证结果
 */
- (BOOL)validateValidPostalcode;

/**
 是否工商税号
 
 @return 验证结果
 */
- (BOOL)validateTaxNo;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)validateWithMinLenth:(NSInteger)minLenth
                    maxLenth:(NSInteger)maxLenth
              containChinese:(BOOL)containChinese
         firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)validateWithMinLenth:(NSInteger)minLenth
                    maxLenth:(NSInteger)maxLenth
              containChinese:(BOOL)containChinese
               containDigtal:(BOOL)containDigtal
               containLetter:(BOOL)containLetter
       containOtherCharacter:(NSString *)containOtherCharacter
         firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 精确身份证号码验证
 
 @return 验证结果
 */
- (BOOL)validateAccurateVerifyIDCardNumber;

/** 银行卡号有效性问题Luhn算法
 *  现行 16 位银联卡现行卡号开头 6 位是 622126～622925 之间的，7 到 15 位是银行自定义的，
 *  可能是发卡分行，发卡网点，发卡序号，第 16 位是校验码。
 *  16 位卡号校验位采用 Luhm 校验方法计算：
 *  1，将未带校验位的 15 位卡号从右依次编号 1 到 15，位于奇数位号上的数字乘以 2
 *  2，将奇位乘积的个十位全部相加，再加上所有偶数位上的数字
 *  3，将加法和加上校验位能被 10 整除。
 */
- (BOOL)validateBankCardluhm;

/**
 是否能够匹配正则表达式
 
 @param regex  正则表达式
 @param options     普配方式.
 @return YES：如果可以匹配正则表达式; 否则,NO.
 */
- (BOOL)matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

/**
 匹配正则表达式，并使用匹配的每个对象执行给定的块。
 
 @param regex    正则表达式
 @param options  上报的匹配选项.
 @param block    应用于在数组元素中匹配的块.
 该块需要四个参数:
 match: 匹配的子串.
 matchRange: 匹配选项.
 stop: 一个布尔值的引用。块可以设置YES来停止处理阵列。stop参数是一个唯一的输出。你应该给块设置YES。
 */
- (void)enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block;

/**
 返回一个包含匹配正则表达式的新字符串替换为模版字符串。
 
 @param regex       正则表达式
 @param options     上报的匹配选项.
 @param replacement 用来替换匹配到的内容.
 
 @return 返回一个用指定字符串替换匹配字符串后的字符串.
 */
- (NSString *)stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement;

@end
