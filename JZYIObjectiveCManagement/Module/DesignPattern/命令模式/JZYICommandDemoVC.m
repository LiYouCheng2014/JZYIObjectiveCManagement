//
//  JZYICommandDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYICommandDemoVC.h"

#import "Receiver.h"

#import "Invoker.h"
#import "DarkCommand.h"
#import "LightCommand.h"

@interface JZYICommandDemoVC ()

@property (nonatomic, strong) JZYIButton *addButton; //!<
@property (nonatomic, strong) JZYIButton *delButton; //!<
@property (nonatomic, strong) JZYIButton *rolButton; //!<

@property (nonatomic, strong) Receiver *receiver; //!<

@end

@implementation JZYICommandDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.receiver = [[Receiver alloc] init];
    self.receiver.clientView = self.view;
    
    [self.view addSubview:self.addButton];
    [self.view addSubview:self.delButton];
    [self.view addSubview:self.rolButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)p_clickedSelect:(UIButton *)btn {
    if (btn.tag == 100) {
        NSLog(@"加");
        LightCommand *command = [[LightCommand alloc] initWithReceive:self.receiver paramter:0.1];
        [[Invoker shareInstance] addAndExcute:command];
    }
    else if (btn.tag == 101) {
        NSLog(@"减");
        
        DarkCommand *command = [[DarkCommand alloc] initWithReceive:self.receiver paramter:0.1];
        [[Invoker shareInstance] addAndExcute:command];
        
    }
    else if (btn.tag == 102) {
        NSLog(@"回滚");
        [[Invoker shareInstance] rollBack];
    }
    
}

- (JZYIButton *)addButton {
    if (!_addButton) {
        _addButton = [JZYIButton setupButtonWithFrame:CGRectMake(100, 100, 100, 40) font:[UIFont fontFor28] target:self action:@selector(p_clickedSelect:) borderWidth:0 borderColor:nil cornerRadius:0];
        _addButton.tag = 100;
        _addButton.backgroundColor = [UIColor greenColor];
        [_addButton setTitle:@"加" forState:UIControlStateNormal];

    }
    return _addButton;
}

- (JZYIButton *)delButton {
    if (!_delButton) {
        _delButton = [JZYIButton setupButtonWithFrame:CGRectMake(100, 160, 100, 40) font:[UIFont fontFor28] target:self action:@selector(p_clickedSelect:) borderWidth:0 borderColor:nil cornerRadius:0];
        _delButton.tag = 101;
        _delButton.backgroundColor = [UIColor greenColor];
        [_delButton setTitle:@"减" forState:UIControlStateNormal];
        
    }
    return _delButton;
}

- (JZYIButton *)rolButton {
    if (!_rolButton) {
        _rolButton = [JZYIButton setupButtonWithFrame:CGRectMake(100, 220, 100, 40) font:[UIFont fontFor28] target:self action:@selector(p_clickedSelect:) borderWidth:0 borderColor:nil cornerRadius:0];
        _rolButton.tag = 102;
        _rolButton.backgroundColor = [UIColor greenColor];
        [_rolButton setTitle:@"回滚" forState:UIControlStateNormal];
        
    }
    return _rolButton;
}

@end
