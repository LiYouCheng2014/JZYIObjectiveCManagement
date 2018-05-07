//
//  JZYIAppearanceDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIAppearanceDemoVC.h"

#import "ShapeMaker.h"

@interface JZYIAppearanceDemoVC ()

@end

@implementation JZYIAppearanceDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ShapeMaker drawCicleWithParas:nil];
    
    [ShapeMaker drawCicleAdnRectangle:nil];
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
