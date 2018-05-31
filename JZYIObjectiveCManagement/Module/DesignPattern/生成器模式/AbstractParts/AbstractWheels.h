//
//  AbstractWheels.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/30.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol AbstractWheels <NSObject>

@required
//轮子的数目
- (void)wheelsNumber:(NSNumber *)number;

//轮子信息
- (NSString *)infomation;

@end
