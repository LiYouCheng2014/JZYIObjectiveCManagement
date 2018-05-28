//
//  DemoView.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView

- (id)currentState {
    return @{@"frame": NSStringFromCGRect(self.frame)};
}

- (void)recoverFromState:(id)state {
    NSDictionary *dict = state;
    self.frame = CGRectFromString(dict[@"frame"]);
    //    self = state;
}

@end
