//
//  GoogleFactory.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "GoogleFactory.h"

#import "Android.h"
#import "AndroidWatch.h"

@implementation GoogleFactory

- (BasePhone *)createPhone
{
    return [[Android alloc] init];
}

- (BaseWatch *)createWatch
{
    return [[AndroidWatch alloc] init];
}

@end
