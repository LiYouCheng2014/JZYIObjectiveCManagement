//
//  TCPProtocol.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/18.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TCPProtocol <NSObject>

@required;
- (NSInteger)sourcePort;
- (NSInteger)destinationPort;

@end
