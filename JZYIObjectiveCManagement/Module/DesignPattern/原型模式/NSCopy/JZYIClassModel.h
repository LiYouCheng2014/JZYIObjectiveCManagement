//
//  JZYIClassModel.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "BaseCopyObject.h"

@interface JZYIClassModel : BaseCopyObject

@property (nonatomic, copy) NSString *className; //!< 注释
@property (nonatomic, strong) NSArray *students; //!<

@end
