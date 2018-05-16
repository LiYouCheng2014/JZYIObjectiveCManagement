//
//  BaseFactory.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BasePhone.h"
#import "BaseWatch.h"

@interface BaseFactory : NSObject

- (BasePhone *)createPhone;
- (BaseWatch *)createWatch;

@end
