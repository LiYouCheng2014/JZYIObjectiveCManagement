//
//  JZYIBlockVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/29.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIBlockVC.h"

#import <AFNetworking.h>

@interface JZYIBlockVC ()

@end

@implementation JZYIBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //问题一：什么时候在 block 里面用 self，不需要使用 weak self？
//    当 block 本身不被 self 持有，而被别的对象持有，同时不产生循环引用的时候，就不需要使用 weak self 了
    // UIView动画块用self不需要用strongself
    [UIView animateWithDuration:2 animations:^{
        self.view.alpha = 1;
    }];
    
    
//    当动画结束时，UIView 会结束持有这个 block，如果没有别的对象持有 block 的话，block 对象就会释放掉，从而 block 会释放掉对于 self 的持有。整个内存引用关系被解除。
    
    //问题二:为什么 block 里面还需要写一个 strong self，如果不写会怎么样？
    __weak typeof(self) weakSelf = self;
    [self doSomeBlockJob:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            
        }
    }];

    
    //问题三：有没有这样一个需求场景，block会产生循环引用，但是业务又需要你不能使用 weak self? 如果有，请举一个例子并且解释这种情况下如何解决循环引用问题。
    
//    你需要构造一个循环引用，以便保证引用双方都存在。比如你有一个后台的任务，希望任务执行完后，通知另外一个实例。在我们开源的 YTKNetwork 网络库的源码中，就有这样的场景。
    
//    第一个办法是「事前避免」，我们在会产生循环引用的地方使用 weak 弱引用，以避免产生循环引用。
//
//    第二个办法是「事后补救」，我们明确知道会存在循环引用，但是我们在合理的位置主动断开环中的一个引用，使得对象得以回收。
    
//    问题四：weak 变量在引用计数为 0 时，会被自动设置成 nil，这个特性是如何实现的？
    
//    Yuen 提问：“数组” 和 “字典” 的 enumeratXXXUsingBlock: 是否要使用 weakSelf 和 strongSelf 呢？
//
//    潇湘雨同学提问：block 里 strong self 后，block 不是也会持有 self 吗？而 self 又持有 block ，那不是又循环引用了？
   
    
    
    
    
}

- (void)doSomeBlockJob:(void(^)(void))block {
    
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
