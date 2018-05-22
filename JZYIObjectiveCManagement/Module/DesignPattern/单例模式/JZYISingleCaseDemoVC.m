//
//  JZYISingleCaseDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYISingleCaseDemoVC.h"

#import "UserInfoManagerCenter.h"
#import "NewUserInfoManagerCenter.h"

#import "NSObject+StoreValue.h"

#import "TestStudentModel.h"
#import "InfoModel.h"
@interface JZYISingleCaseDemoVC ()

@end

@implementation JZYISingleCaseDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"1=>%@",[UserInfoManagerCenter managerCenter]);
//    NSLog(@"2=>%@",[[UserInfoManagerCenter alloc] init]);
//    NSLog(@"3=>%@",[[NewUserInfoManagerCenter alloc] init]);
//    NSLog(@"4=>%@",[NewUserInfoManagerCenter managerCenter]);
    
//    [[StoreValue shareInstance] storeValue:@[ @"A", @"B" ] withKey:@"test"];
//    NSArray *array = [[StoreValue shareInstance] valueWithKey:@"test"];
//    NSLog(@"array = %@",array);
    
    TestStudentModel *s = [[TestStudentModel alloc] init];
    s.name = @"A";
    
    NSArray *array = @[ [InfoModel new],[InfoModel new],[InfoModel new] ];
    s.infoArray = array;
    
    [s storeValueWithKey:@"test1"];
    TestStudentModel *newModel = [TestStudentModel valueWithKey:@"test1"];
    NSLog(@"%@, %@",newModel.name,newModel.infoArray);
    
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
