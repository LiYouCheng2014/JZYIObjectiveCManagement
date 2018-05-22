//
//  NSObject+StoreValue.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (StoreValue)

- (void)storeValueWithKey:(NSString *)key;
+ (id)valueWithKey:(NSString *)key;

@end
