//
//  Caculator.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Caculator : NSObject

@property (nonatomic, assign) BOOL isEqule ;  //!<
@property (nonatomic, assign) int result ;  //!<

- (Caculator *)caculator:(int(^)(int result))caculator;
- (Caculator *)equle:(BOOL(^)(int result))operation;

@end
