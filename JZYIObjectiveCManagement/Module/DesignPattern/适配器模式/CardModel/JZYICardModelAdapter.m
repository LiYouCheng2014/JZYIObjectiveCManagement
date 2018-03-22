//
//  JZYICardModelAdapter.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYICardModelAdapter.h"

#import "JZYICardModel.h"

@implementation JZYICardModelAdapter

- (instancetype)initWithData:(id)data
{
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}

- (NSString *)name {
    JZYICardModel *model = self.data;
    return model.name;
}

- (UIColor *)lineColor {
    JZYICardModel *model = self.data;
    return model.lineColor;
}

- (NSString *)phoneNumber {
    JZYICardModel *model = self.data;
    return model.phoneNumber;
}

@end
