//
//  StudentModel.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PrototypeCopyProtocol.h"

@interface StudentModel : NSObject<PrototypeCopyProtocol>

@property (nonatomic, copy) NSString *name; //!< 名字
@property (nonatomic, copy) NSString *address; //!< 地址
@property (nonatomic, assign) NSInteger age; //!< 年龄
@property (nonatomic, assign) NSInteger totalScore; //!< 分数

@end
