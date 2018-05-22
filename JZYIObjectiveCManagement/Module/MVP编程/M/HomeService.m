//
//  HomeService.m
//  ByYourself
//
//  Created by Lin YiPing on 2018/5/14.
//  Copyright © 2018年 LeoFeng. All rights reserved.
//

#import "HomeService.h"

@implementation HomeService

- (void)getHomeDataComplete:(void (^)(NSDictionary *, NSError *))complete {
    
    NSDictionary *dic = @{
                          @"status" : @"200",
                          @"name" : @"我的",
                          @"time" : @"2018-05-14"
                          };
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        complete(dic, nil);
    });
}

@end
