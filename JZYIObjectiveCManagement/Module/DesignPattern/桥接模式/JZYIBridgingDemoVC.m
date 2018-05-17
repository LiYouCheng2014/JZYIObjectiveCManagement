//
//  JZYIBridgingDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/17.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIBridgingDemoVC.h"

#import "GBASystem.h"
#import "GBAImplementor.h"

#import "PSPSystem.h"
#import "PSPImplementor.h"

@interface JZYIBridgingDemoVC ()

@end

@implementation JZYIBridgingDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AbstractSystem *gbaSystem = [[GBASystem alloc] init];
    [gbaSystem loadSystem];
    
    gbaSystem.implementor = [[GBAImplementor alloc] init];
    [gbaSystem command_up];
    
    
    PSPSystem *pspSystem = [[PSPSystem alloc] init];
    [pspSystem loadSystem];
    pspSystem.implementor = [[PSPImplementor alloc] init];
    [pspSystem command_down];
    [pspSystem command_x];
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
