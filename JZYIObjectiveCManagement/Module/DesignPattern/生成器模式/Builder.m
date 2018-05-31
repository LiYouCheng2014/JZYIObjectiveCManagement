//
//  Builder.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "Builder.h"

@implementation Builder

- (void)buildAllParts
{
    //创建部件
    [self.engine build];
    [self.wheels build];
    [self.door build];
    
    //组装产品
    NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
    dataDict[@"engine"] = [self.engine infomation];
    dataDict[@"wheels"] = [self.wheels infomation];
    dataDict[@"door"] = [self.door infomation];
    
    self.productsInfo = dataDict;
}

//- (id)builderAll
//{
//    Builder *builder = [[[self class] alloc] init];
//    [builder.partOne build];
//    [builder.partTwo build];
//
//    return builder;
//}

@end
