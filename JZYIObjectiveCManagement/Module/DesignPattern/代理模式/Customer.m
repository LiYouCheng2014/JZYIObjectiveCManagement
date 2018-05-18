//
//  Customer.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/18.
//  Copyright © 2018年 KAISA. All rights reserved.
//

//顾客
#import "Customer.h"

@implementation Customer

- (void)buyItemCount:(NSInteger)count
{
    #warning 改进前
    if (self.controller) {
        [self.controller customerButItemCount:count];
    }
    
    #warning 改进后
    if (self.delegate && [self.delegate respondsToSelector:@selector(customer:buyItemCount:)]) {
        [self.delegate customer:self buyItemCount:count];
    }
}

@end
