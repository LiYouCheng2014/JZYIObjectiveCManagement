//
//  Apple.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MemoCenterProtocol.h"

@interface Apple : NSObject<MemoCenterProtocol>

@property (nonatomic, strong) NSString *name; //!<
@property (nonatomic, strong) NSNumber *age; //!< 

@end
