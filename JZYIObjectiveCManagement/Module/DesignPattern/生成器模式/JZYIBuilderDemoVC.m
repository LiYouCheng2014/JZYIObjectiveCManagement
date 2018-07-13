//
//  JZYIBuilderDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIBuilderDemoVC.h"

#import "Builder.h"
#import "Engine.h"
#import "Wheels.h"
#import "Door.h"

@interface JZYIBuilderDemoVC ()

@property (nonatomic, strong) Builder *builder; //!<


@end

@implementation JZYIBuilderDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建组装者
    self.builder = [Builder new];
    
    //指定承包商
    self.builder.engine = [Engine new];
    self.builder.wheels = [Wheels new];
    self.builder.door = [Door new];
    
    //构建所有的部件
    [self.builder buildAllParts];
    
    //获取产品
    NSLog(@"%@",self.builder.productsInfo);
    
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
