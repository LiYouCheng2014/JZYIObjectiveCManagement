//
//  HomeService.h
//  ByYourself
//
//  Created by Lin YiPing on 2018/5/14.
//  Copyright © 2018年 LeoFeng. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeService : NSObject


- (void)getHomeDataComplete:(void(^)(NSDictionary *dict, NSError *error))complete;


@end
