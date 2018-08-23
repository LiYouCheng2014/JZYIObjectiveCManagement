//
//  JZYIDataStore.h
//  JZYItool
//
//  Created by liyoucheng on 2018/6/1.
//

#import <Foundation/Foundation.h>

@interface JZYIDataStoreManagement : NSObject

+ (instancetype)shareInstance;

/**
 存储数据

 @param value 值
 @param key 键
 */
- (void)storeValue:(id)value withKey:(NSString *)key;

/**
 读取数据

 @param key 键
 @return 结果
 */
- (id)valueWithKey:(NSString *)key;

@end
