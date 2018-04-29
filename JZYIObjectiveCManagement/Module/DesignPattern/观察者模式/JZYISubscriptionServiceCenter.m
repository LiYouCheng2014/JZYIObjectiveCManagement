//
//  JZYISubscriptionServiceCenter.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/24.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYISubscriptionServiceCenter.h"

static NSMutableDictionary *_subscriptionDictionary = nil;

@implementation JZYISubscriptionServiceCenter

//不建议使用此方法
+ (void)initialize {
    if (self == [JZYISubscriptionServiceCenter class]) {
        _subscriptionDictionary = [NSMutableDictionary dictionary];
    }
}

+ (void)createSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable == nil) {
        hashTable = [NSHashTable weakObjectsHashTable];
        [_subscriptionDictionary setObject:hashTable forKey:subscriptionNumber];
    }
}

+ (void)removeSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable) {
        [_subscriptionDictionary removeObjectForKey:subscriptionNumber];
    }
}

+ (void)addCustomer:(id <JZYISubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSParameterAssert(customer);
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    [hashTable addObject:customer];
}

+ (void)removeCustomer:(id <JZYISubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber
{
//    NSParameterAssert(customer);
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    [hashTable removeObject:customer];
}

+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable) {
        
        NSEnumerator *enumerator = [hashTable objectEnumerator];
        id <JZYISubscriptionServiceCenterProtocol> object = nil;
        while (object = [enumerator nextObject]) {
            
            if ([object respondsToSelector:@selector(subscriptionMeesage:withSubscriptionNumber:)]) {
                [object subscriptionMeesage:message withSubscriptionNumber:subscriptionNumber];
            }
            
        }
        
    }
}

#pragma mark - 私有方法
+ (NSHashTable *)existSubscriptionNumber:(NSString *)subscriptionNumber
{
    return [_subscriptionDictionary objectForKey:subscriptionNumber];
}

@end
