//
//  BuilderProtocol.h
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BuilderProtocol <NSObject>

@required
//构建对象
- (id)build;

@end
