//
//  JZYIModel.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIModel.h"

@implementation JZYIModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return [self jzyi_replacedKeyFromPropertyName];
}

+ (NSDictionary *)mj_objectClassInArray {
    return [self jzyi_objectClassInArray];
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property {
    return [self jzyi_newValueFromOldValue:oldValue property:property];
}

//重写
+ (NSDictionary *)jzyi_replacedKeyFromPropertyName {
    return nil;
}

//重写
+ (NSDictionary *)jzyi_objectClassInArray {
    return nil;
}

//重写
- (id)jzyi_newValueFromOldValue:(id)oldValue property:(MJProperty *)property {
    if (oldValue) {
        return oldValue;
    }
    return nil;
}

+ (instancetype)jzyi_objectWithKeyValues:(id)keyValues {
    return [super mj_objectWithKeyValues:keyValues];
}

+ (NSMutableArray *)jzyi_objectArrayWithKeyValuesArray:(NSArray *)keyValuesArray {
    return [super mj_objectArrayWithKeyValuesArray:keyValuesArray];
}

@end
