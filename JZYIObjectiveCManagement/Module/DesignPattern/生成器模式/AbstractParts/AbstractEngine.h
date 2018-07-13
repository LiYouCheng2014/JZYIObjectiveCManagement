//
//  AbstractEngine.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/30.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol AbstractEngine <NSObject>

@required
//引擎的尺寸
- (void)engineScale:(CGFloat)scale;

//引擎的重量
- (void)engineWeight:(CGFloat)kg;

//引擎信息
- (NSString *)infomation;
@end
