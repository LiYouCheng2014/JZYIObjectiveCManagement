//
//  HomeViewController.m
//  ByYourself
//
//  Created by Lin YiPing on 2018/5/14.
//  Copyright © 2018年 LeoFeng. All rights reserved.
//

#import "HomeViewController.h"
#import "HomePresent.h"
#import "HomeModel.h"

static NSString *identifier = @"UITableViewCell";
@interface HomeViewController ()<HomeLogic, UITableViewDataSource> {
    HomePresent *_present;//协调器
    NSMutableArray<HomeModel *> *_dataMArray;//!<数据源
    
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataMArray = [NSMutableArray array];
#pragma mark -- MVP编程
    /**
     * 对于view上面的一些响应事件或者数据更新相关逻辑应该在Present中进行
     */
    _present = [[HomePresent alloc] init];
    [_present attachView:self];
    [_present fetchData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self->_dataMArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [self->_dataMArray[indexPath.row] name];
    //或者去model化，直接用字典赋值
//    UIKIT_EXTERN NSString * const HomeNameKey;
    return cell;
}
#pragma mark -- HomeLogic 相关操作逻辑接口 
- (void)showLoadingView {
    NSLog(@"加载动画开始");
}

- (void)hiddenLoadingView {
    NSLog(@"加载动画隐藏");
}

- (void)updateViewWithData:(NSArray *)arr {
    self->_dataMArray = arr.mutableCopy;
    //tableView reloadData
}

- (void)getNetDataFailed {
    NSLog(@"数据请求失败的操作");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
