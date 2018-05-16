//
//  BaseFactory.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "BaseFactory.h"

@implementation BaseFactory

- (BasePhone *)createPhone
{
    //加入不准直接调用，必须子类重载
    return nil;
}

- (BaseWatch *)createWatch
{
    return nil;
}

@end
