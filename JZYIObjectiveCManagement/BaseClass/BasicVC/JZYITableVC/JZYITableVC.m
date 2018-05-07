//
//  JZYITableVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/29.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYITableVC.h"

@interface JZYITableVC ()

@end

@implementation JZYITableVC

#pragma mark - 1、生命周期函数 life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 2、系统代理 system delegate

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - 4、相关响应事件 event response

#pragma mark - 5、自定义函数 private methods

- (void)setupTableVC
{
    [self.view addSubview:self.listTableView];
    
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
        make.center.equalTo(self.view);
    }];
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters

- (JZYITableView *)listTableView {
    if (!_listTableView) {
        _listTableView = [JZYITableView setupTableViewWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
    return _listTableView;
}

@end
