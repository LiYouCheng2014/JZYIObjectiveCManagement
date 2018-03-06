//
//  Caculator.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "Caculator.h"

@implementation Caculator

- (Caculator *)caculator:(int(^)(int result))caculator
{
    self.result = caculator(self.result);
    return self;
}

- (Caculator *)equle:(BOOL(^)(int result))operation
{
    self.isEqule = operation(self.result);
    return self;
}

@end
