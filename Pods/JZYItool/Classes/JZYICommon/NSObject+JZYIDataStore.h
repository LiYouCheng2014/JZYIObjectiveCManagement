//
//  NSObject+DataStore.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JZYIDataStore)

/**
 存储数据

 @param key 键
 */
- (void)storeValueWithKey:(NSString *)key;

/**
 读取数据

 @param key 键
 @return 结果
 */
+ (id)valueWithKey:(NSString *)key;

@end
