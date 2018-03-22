//
//  JZYIBusinessCardView.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JZYIBusinessCardAdapterProtocol.h"

@interface JZYIBusinessCardView : UIView

@property (nonatomic, copy) NSString *name; //!< 名字
@property (nonatomic, copy) UIColor *lineColor; //!< 线条颜色
@property (nonatomic, copy) NSString *phoneNumber; //!< 电话号码


/**
 加载数据（实现了JZYIBusinessCardAdapterProtocol协议）

 @param data 数据
 */
- (void)loadData:(id <JZYIBusinessCardAdapterProtocol>)data;

@end
