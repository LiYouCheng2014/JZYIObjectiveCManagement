//
//  AbstractProxy.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/18.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbstractProxy : NSProxy

@property (nonatomic, weak) id delegate; //!<

@end
