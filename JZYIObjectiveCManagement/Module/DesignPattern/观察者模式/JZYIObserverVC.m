//
//  JZYIObserverVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/24.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIObserverVC.h"

#import "JZYISubscriptionServiceCenter.h"

#import "JZYIObserverTestModel.h"

static NSString *SCIENCE = @"SCIENCE";
static NSString *SCIENCE1 = @"SCIENCE1";
static NSString *SCIENCE2 = @"SCIENCE2";

@interface JZYIObserverVC ()
<JZYISubscriptionServiceCenterProtocol>

@property (nonatomic, strong) JZYIObserverTestModel *testModel; //!< 需要强引用，kvo

@end

@implementation JZYIObserverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark - 观察者模式
    //创建订阅号
    [JZYISubscriptionServiceCenter createSubscriptionNumber:SCIENCE];
    
    //添加订阅的用户到指定的刊物
    [JZYISubscriptionServiceCenter addCustomer:self withSubscriptionNumber:SCIENCE];
    
    //发送机构发送消息
    [JZYISubscriptionServiceCenter sendMessage:@"V1.0" toSubscriptionNumber:SCIENCE];
    
    
#pragma mark - 通知中心
    //添加客户到指定的订阅号中
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCenterEvent:) name:SCIENCE1 object:nil];
    //发送信息到指定的订阅号中
    [[NSNotificationCenter defaultCenter] postNotificationName:SCIENCE1 object:@"V1.0"];
    
#pragma mark - KVO
    //创建订阅中心
    self.testModel = [JZYIObserverTestModel new];
    //客户添加了订阅中心的“name”服务 NSStringFromSelector(@selector(name))防止写错名字
    [self.testModel addObserver:self forKeyPath:NSStringFromSelector(@selector(name)) options:NSKeyValueObservingOptionNew context:nil];
    //订阅中心发送消息（通过修改属性值）
    self.testModel.name = @"测试";
}

#pragma mark - 观察者模式

- (void)subscriptionMeesage:(id)message withSubscriptionNumber:(NSString *)subscriptionNumber {
    NSLog(@"观察者模式===> %@   %@",message,subscriptionNumber);
}

#pragma mark - 通知中心

- (void)notificationCenterEvent:(NSNotification *)noti {
    NSLog(@"通知中心===> %@",noti.object);
}


#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"KVO===> %@",change);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    //移除kvo
    [self.testModel removeObserver:self forKeyPath:NSStringFromSelector(@selector(name))];
    //移除通知中心
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:SCIENCE1];
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
