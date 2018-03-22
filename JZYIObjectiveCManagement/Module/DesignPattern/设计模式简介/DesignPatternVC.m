//
//  DesignPatternVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/21.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "DesignPatternVC.h"

#import "BaseAnimationView.h"
#import "FadeAnimationView.h"
#import "ScaleAnimationView.h"

@interface DesignPatternVC ()

@end

@implementation DesignPatternVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavTitle:@"设计模式简介"];
    
    //里氏代换原则
    BaseAnimationView *animationView = [[FadeAnimationView alloc] init];
    [animationView changeToNormalStateAnimated:true duration:0.5];
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
