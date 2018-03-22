//
//  JZYINewCardModelAdapter.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYINewCardModelAdapter.h"

#import "JZYINewCardModel.h"

@implementation JZYINewCardModelAdapter


- (instancetype)initWithData:(id)data
{
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}

- (NSString *)name {
    JZYINewCardModel *model = self.data;
    return model.name;
}

- (UIColor *)lineColor {
    JZYINewCardModel *model = self.data;
    return [UIColor getColor:model.colorHexString];
}

- (NSString *)phoneNumber {
    JZYINewCardModel *model = self.data;
    return model.phoneNumber;
}

@end
