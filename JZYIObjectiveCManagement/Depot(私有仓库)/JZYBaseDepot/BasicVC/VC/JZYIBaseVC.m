 //
//  JZYIBaseVC.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIBaseVC.h"

#import "JZYIUtilsMacro.h"

@interface JZYIBaseVC ()

@end

@implementation JZYIBaseVC

- (void)dealloc {
    JZYILog(@"释放类==>:%@",NSStringFromClass([self class]));
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    JZYILog(@"出现类==>:%@",NSStringFromClass([self class]));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    JZYILog(@"消失类==>:%@",NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
