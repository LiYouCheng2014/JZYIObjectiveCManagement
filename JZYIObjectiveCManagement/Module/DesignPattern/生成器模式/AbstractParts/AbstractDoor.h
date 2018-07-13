//
//  AbstractDoor.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/30.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol AbstractDoor <NSObject>

@required
//门的颜色
- (void)doorColor:(UIColor *)color;

//轮子信息
- (NSString *)infomation;

@end
