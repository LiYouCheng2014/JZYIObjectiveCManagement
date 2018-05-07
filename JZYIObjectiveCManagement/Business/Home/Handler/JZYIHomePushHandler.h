//
//  JZYIHomePushHandler.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/29.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JZYIHomeRowModel;

@interface JZYIHomePushHandler : NSObject

+(void)goVCWithTarget:(UIViewController *)target model:(JZYIHomeRowModel *)model;

@end
