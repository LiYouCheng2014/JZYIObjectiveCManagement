//
//  JZYISubscriptionServiceCenterProtocol.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/24.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JZYISubscriptionServiceCenterProtocol <NSObject>

@required
- (void)subscriptionMeesage:(id)message withSubscriptionNumber:(NSString *)subscriptionNumber;

@end
