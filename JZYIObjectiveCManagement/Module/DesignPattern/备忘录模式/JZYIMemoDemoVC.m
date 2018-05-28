//
//  JZYIMemoDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIMemoDemoVC.h"

#import "Apple.h"
#import "MemoCenter.h"
#import "NSObject+MemoCenter.h"


#import "DemoView.h"
@interface JZYIMemoDemoVC ()

@end

@implementation JZYIMemoDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Apple *apple = [Apple new];
//    apple.name = @"shixiaofan";
//    apple.age = @(28);
//
//    //save state
//    [MemoCenter saveMemoObject:apple withKey:@"Apple"];
    
    // get state
//    [apple recoverFromState:[MemoCenter memoObjectWithKey:@"Apple"]];
//
//    [apple saveStateWithKey:@"ben"];
    
    [apple recoverFromStateWithKey:@"ben"];
    NSLog(@"apple.name = %@",apple.name);
    
    
    DemoView *view = [DemoView new];
    view.frame = CGRectMake(100, 100, 100, 100);
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    
//    [view saveStateWithKey:@"demoview"];
    
    [view recoverFromStateWithKey:@"demoview"];
    
    NSLog(@"%@",view);
    
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
