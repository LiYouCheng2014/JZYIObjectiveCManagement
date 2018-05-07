//
//  JZYIStudentModel.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIStudentModel.h"

@implementation JZYIStudentModel

- (void)copyOperationWithObject:(id)obj {
    JZYIStudentModel *model = (JZYIStudentModel *)obj;
    
    model.name = self.name;
    model.age = self.age;
}

@end
