//
//  Builder.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>
//
#import "BuilderProtocol.h"

#import "AbstractEngine.h"
#import "AbstractWheels.h"
#import "AbstractDoor.h"



//#import "AbstractPartOne.h"
//#import "AbstractPartTwo.h"

@interface Builder : NSObject

@property (nonatomic, strong) NSDictionary *productsInfo; //!< 产品信息

@property (nonatomic, strong) id <BuilderProtocol, AbstractEngine> engine; //!<
@property (nonatomic, strong) id <BuilderProtocol, AbstractWheels> wheels; //!<
@property (nonatomic, strong) id <BuilderProtocol, AbstractDoor> door; //!<


//构建所有产品
- (void)buildAllParts;
//@property (nonatomic, strong) id <BuilderProtocol, AbstractPartOne> partOne; //!<
//@property (nonatomic, strong) id <BuilderProtocol, AbstractPartTwo> partTwo; //!<

//- (id)builderAll;

@end
