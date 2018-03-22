//
//  CaculatorMaker.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CaculatorMaker;
@interface NSObject (Caculator)

+ (int)makeCaculators:(void(^)(CaculatorMaker *make))caculatorMaker;

@end

@interface CaculatorMaker : NSObject

@property (nonatomic, assign) int result;

- (CaculatorMaker *(^)(int))add;
- (CaculatorMaker *(^)(int))sub;
- (CaculatorMaker *(^)(int))muilt;
- (CaculatorMaker *(^)(int))divide;

@end
