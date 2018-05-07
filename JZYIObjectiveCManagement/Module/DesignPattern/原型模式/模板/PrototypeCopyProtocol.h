//
//  PrototypeCopyProtocol.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PrototypeCopyProtocol <NSObject>

@required
- (id)clone;

@end
