//
//  JZYIDelegateDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/18.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIDelegateDemoVC.h"

#import "Customer.h"
#import "TCPProtocol.h"
#import "Model.h"

#import "ConcreteProxy.h"

//经销商
@interface JZYIDelegateDemoVC ()<CustomerDelegate,MessageProtocol>

@property (nonatomic, assign) NSInteger sourcePort; //!<
@property (nonatomic, assign) NSInteger destinationPort; //!<

@end

@implementation JZYIDelegateDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Customer *c = [[Customer alloc] init];
    #warning 改进前
    c.controller = self;
    #warning 改进后
    c.delegate = self;
    [c buyItemCount:4];
    
    
    Model *model = [[Model alloc] init];
    [self accessTCPDat:model];
    
    
    ConcreteProxy *proxy = [ConcreteProxy alloc];
    proxy.delegate = self;
    [proxy helloWord];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#warning 改进后
#pragma mark - CustomerDelegate

- (void)customer:(Customer *)customer buyItemCount:(NSInteger)count {
    NSLog(@"buyItemCount = %d",count);
}

#warning 改进前
//顾客购买商品
- (void)customerButItemCount:(NSInteger)count
{
    NSLog(@"count = %d",count);
}


- (void)accessTCPDat:(id <TCPProtocol>)data {
    self.sourcePort = [data sourcePort];
    self.destinationPort = [data destinationPort];
    
    NSLog(@"self.sourcePort = %d",self.sourcePort);
}

#pragma mark - MessageProtocol

- (void)helloWord {
    NSLog(@"excute helloWord");
}

@end
