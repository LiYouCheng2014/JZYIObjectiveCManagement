//
//  JZYIPrototypeDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIPrototypeDemoVC.h"

#import "StudentModel.h"

#import "JZYIClassModel.h"
#import "JZYIStudentModel.h"

@interface JZYIPrototypeDemoVC ()

@end

@implementation JZYIPrototypeDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //原型模式
    JZYIStudentModel *stu1 = [JZYIStudentModel new];
    stu1.name = @"小明";
    
    JZYIStudentModel *stu2 = [stu1 copy];
    
    JZYIClassModel *class1 = [JZYIClassModel new];
    class1.className = @"班级一";
    class1.students = @[ stu1,stu2 ];
    
    JZYIClassModel *class2 = [class1 copy];
    NSLog(@"%@=%@",class1.className,class2.className);
    NSLog(@"%@=%@",class1.students,class2.students);
    
    //class拷贝了，但是student只是做了引用。就是浅拷贝
    //如需深拷贝，见model说明
    
    
//    StudentModel *stu1 = [StudentModel new];
//    stu1.name = @"liyoucheng";
//    stu1.age = 15;
//    stu1.address = @"深圳";
//    stu1.totalScore = 100;
//
//    StudentModel *stu2 = [stu1 clone];
//    NSLog(@"name = %@",stu2.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
