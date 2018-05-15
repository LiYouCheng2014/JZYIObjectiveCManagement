//
//  JZYIDecorateDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/15.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIDecorateDemoVC.h"

#import "GamePadDecorate.h"

#import "CheatGamePadDecorator.h"

@interface JZYIDecorateDemoVC ()



@end

@implementation JZYIDecorateDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GamePadDecorate *test1 = [GamePadDecorate new];
    [test1 up];
    
    CheatGamePadDecorator *test2 = [CheatGamePadDecorator new];
    [test2 cheat];
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
