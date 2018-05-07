//
//  StudentModel.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

- (id)clone {
    StudentModel *stu = [StudentModel new];
    stu.name = self.name;
    stu.address = self.address;
    stu.age = self.age;
    stu.totalScore = self.totalScore;
    
    return stu;
}

@end
