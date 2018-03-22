//
//  JZYIHomeVC.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIHomeVC.h"

#import "CaculatorMaker.h"
#import "Caculator.h"

//设计模式简介
#import "DesignPatternVC.h"
//适配器模式
#import "AdapterDemoVC.h"

@interface JZYIHomeVC ()

@end

@implementation JZYIHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLeftViewClear];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AdapterDemoVC *vc = [[AdapterDemoVC alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        DesignPatternVC *vc = [[DesignPatternVC alloc] init];
//        [self.navigationController pushViewController:vc animated:true];
//    });
    
    // ReactiveCocoa使用:https://www.jianshu.com/p/87ef6720a096
    /*
     编程思想：
     面向过程：处理事情以过程为核心，一步一步的实现。
     面向对象：万物皆对象
     链式编程思想：是将多个操作（多行代码）通过点号(.)链接在一起成为一句代码,使代码可读性好。a(1).b(2).c(3)，代表：Masonry运用
     响应式编程思想：不需要考虑调用顺序，只需要知道考虑结果，类似于蝴蝶效应，产生一个事件，会影响很多东西，这些事件像流一样的传播出去，然后影响结果，借用面向对象的一句话，万物皆是流。代表：KVO运用
     函数式编程思想：是把操作尽量写成一系列嵌套的函数或者方法调用。每个方法必须有返回值（本身对象）,把函数或者Block当做参数,block参数（需要操作的值）block返回值（操作结果）代表：ReactiveCocoa
     */
    
//    //链式编程思想
//    int result = [NSObject makeCaculators:^(CaculatorMaker *make) {
//        make.add(1).add(2).muilt(5);
//    }];
//    JZYILog(@"result = %d",result);
//
//    //函数式编程思想
//    Caculator *c = [[Caculator alloc] init];
//    BOOL isqule = [[[c caculator:^int(int result) {
//        result += 2;
//        result *= 5;
//        return result;
//    }] equle:^BOOL(int result) {
//        return result == 10;
//    }] isEqule];
//
//    JZYILog(@"是否相等：%d-%d",[c result],isqule);
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
