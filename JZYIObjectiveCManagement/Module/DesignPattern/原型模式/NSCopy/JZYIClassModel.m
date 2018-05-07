//
//  JZYIClassModel.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIClassModel.h"

@implementation JZYIClassModel

- (void)copyOperationWithObject:(id)obj {
    JZYIClassModel *model = (JZYIClassModel *)obj;
    
    model.className = self.className;
    //浅拷贝
//    model.students = self.students;
    //深拷贝 完整 赋值了集合的对象
    model.students = [[NSArray alloc] initWithArray:self.students copyItems:true];
}

@end
