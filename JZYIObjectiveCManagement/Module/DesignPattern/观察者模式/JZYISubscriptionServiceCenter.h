//
//  JZYISubscriptionServiceCenter.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/24.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JZYISubscriptionServiceCenterProtocol.h"

@interface JZYISubscriptionServiceCenter : NSObject


/**
 创建订阅号

 @param subscriptionNumber 订阅号
 */
+ (void)createSubscriptionNumber:(NSString *)subscriptionNumber;

/**
 移除订阅号
 
 @param subscriptionNumber 订阅号
 */
+ (void)removeSubscriptionNumber:(NSString *)subscriptionNumber;


/**
 添加客户到具体的订阅号

 @param customer 客户
 @param subscriptionNumber 订阅号
 */
+ (void)addCustomer:(id <JZYISubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber;


/**
 移除客户到具体的订阅号
 
 @param customer 客户
 @param subscriptionNumber 订阅号
 */
+ (void)removeCustomer:(id <JZYISubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber;


/**
 发送消息到具体的订阅号

 @param message 消息
 @param subscriptionNumber 订阅号
 */
+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber;

@end
