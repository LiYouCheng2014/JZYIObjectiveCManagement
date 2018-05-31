//
//  CommandProtocol.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Receiver.h"

//@class Receiver;

@protocol CommandProtocol <NSObject>

@required
//命令的执行
- (void)excute;

//撤销命令
- (void)rollBackExcute;

@end
