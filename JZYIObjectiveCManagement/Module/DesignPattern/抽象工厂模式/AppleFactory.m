//
//  AppleFactory.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "AppleFactory.h"

#import "iPhone.h"
#import "iWatch.h"

@implementation AppleFactory

- (BasePhone *)createPhone
{
    return [[iPhone alloc] init];
}

- (BaseWatch *)createWatch
{
    return [[iWatch alloc] init];
}

@end
