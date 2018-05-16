//
//  JZYIAbstractFactoryDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIAbstractFactoryDemoVC.h"

#import "FactoryManager.h"

@interface JZYIAbstractFactoryDemoVC ()

@end

@implementation JZYIAbstractFactoryDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BaseFactory *factory = [FactoryManager factoryWithBrand:EfactoryTypeApple];
    BasePhone *phone = [factory createPhone];
    BaseWatch *watch = [factory createWatch];
    
    NSLog(@"%@ %@",phone,watch);
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
