//
//  BaseCopyObject.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCopyObject : NSObject<NSCopying>


/**
 不重载

 @param zone zone description
 @return return value description
 */
- (id)copyWithZone:(NSZone *)zone;


/**
 由子类重载

 @param obj 赋值操作
 */
- (void)copyOperationWithObject:(id)obj;

@end
