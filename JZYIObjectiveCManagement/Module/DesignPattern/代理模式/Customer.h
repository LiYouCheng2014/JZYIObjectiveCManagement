//
//  Customer.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/18.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JZYIDelegateDemoVC.h"

#warning 改进后
@class Customer;
@protocol CustomerDelegate <NSObject>

@required;
//顾客买卖行为
- (void)customer:(Customer *)customer buyItemCount:(NSInteger)count;

@end

@interface Customer : NSObject

#warning 改进后
@property (nonatomic, weak) id<CustomerDelegate> delegate; //!<经销商

#warning 改进前
@property (nonatomic, weak) JZYIDelegateDemoVC *controller; //!<经销商

//顾客买卖行为
- (void)buyItemCount:(NSInteger)count;

@end
