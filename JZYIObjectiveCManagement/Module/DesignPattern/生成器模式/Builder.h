//
//  Builder.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BuilderProtocol.h"
#import "AbstractPartOne.h"
#import "AbstractPartTwo.h"

@interface Builder : NSObject

@property (nonatomic, strong) id <BuilderProtocol, AbstractPartOne> partOne; //!<
@property (nonatomic, strong) id <BuilderProtocol, AbstractPartTwo> partTwo; //!<

- (id)builderAll;

@end
