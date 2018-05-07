//
//  BaseCopyObject.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "BaseCopyObject.h"

@implementation BaseCopyObject

- (id)copyWithZone:(NSZone *)zone {
    BaseCopyObject *copyObject = [[self class] allocWithZone:zone];
    
    //赋值操作，交给子类去做
    [self copyOperationWithObject:copyObject];
    
    return copyObject;
}

@end
