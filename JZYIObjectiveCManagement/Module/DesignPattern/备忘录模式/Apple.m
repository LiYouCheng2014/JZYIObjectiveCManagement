//
//  Apple.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "Apple.h"

@implementation Apple

- (id)currentState {
    return @{ @"name": self.name ? self.name : @"",@"age": self.age ? self.age : @(0) };
}

- (void)recoverFromState:(id)state {
    NSDictionary *dict = state;
    self.name = dict[@"name"];
    self.age = dict[@"age"];
//    self = state;
}

@end
