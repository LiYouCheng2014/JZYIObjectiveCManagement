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
//策略模式
#import "JZYIStrategyDemoVC.h"
//观察者模式
#import "JZYIObserverVC.h"

#import "JZYIHomeSectionModel.h"
#import "JZYIHomeRowModel.h"
#import "JZYIHomeCell.h"
#import "JZYIHomeHeaderView.h"
#import "JZYIHomeFooterView.h"
#import "JZYIHomeHandler.h"
#import "JZYIHomePushHandler.h"

static NSString *kIdentifierCell = @"JZYIHomeCell";
static NSString *kIdentifierHeader = @"JZYIHomeHeaderView";
static NSString *kIdentifierFooter = @"JZYIHomeFooterView";

@interface JZYIHomeVC ()
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *listMArray; //!< 列表数据源

@end

@implementation JZYIHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLeftViewClear];
    
    [self setupHomeVC];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        JZYIObserverVC *vc = [[JZYIObserverVC alloc] init];
//        [self.navigationController pushViewController:vc animated:true];
//    });
    
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

#pragma mark - 1、生命周期函数 life cycle

#pragma mark - 2、系统代理 system delegate

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    JZYIHomeHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kIdentifierHeader];
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    JZYIHomeFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kIdentifierFooter];
    
    return footerView;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //线控制 ios7以上
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    //线控制 ios8以上
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < [self.listMArray count]) {
        
        JZYIHomeSectionModel *sectionModel = self.listMArray[indexPath.section];
        if (indexPath.row < [sectionModel.itemArray count]) {
            JZYIHomeRowModel *rowModel = sectionModel.itemArray[indexPath.row];
            [JZYIHomePushHandler goVCWithTarget:self model:rowModel];
        }
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section < [self.listMArray count]) {
        JZYIHomeSectionModel *sectionModel = self.listMArray[section];
        return [sectionModel.itemArray count];
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.listMArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZYIHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifierCell forIndexPath:indexPath];
    
    if (indexPath.section < [self.listMArray count]) {
        
        JZYIHomeSectionModel *sectionModel = self.listMArray[indexPath.section];
        if (indexPath.row < [sectionModel.itemArray count]) {
            JZYIHomeRowModel *rowModel = sectionModel.itemArray[indexPath.row];
            cell.textLabel.text = rowModel.name;
        }
    }
    
    return cell;
}

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - 4、相关响应事件 event response

#pragma mark - 5、自定义函数 private methods

- (void)setupHomeVC {
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    [self.listTableView registerClass:[JZYIHomeCell class] forCellReuseIdentifier:kIdentifierCell];
    [self.listTableView registerClass:[JZYIHomeHeaderView class] forHeaderFooterViewReuseIdentifier:kIdentifierHeader];
    [self.listTableView registerClass:[JZYIHomeFooterView class] forHeaderFooterViewReuseIdentifier:kIdentifierFooter];
    
    //设置线 ios7以上
    if ([self.listTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.listTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    //设置线 ios8以上
    if ([self.listTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.listTableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters


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

- (NSMutableArray *)listMArray {
    if (!_listMArray) {
        _listMArray = [NSMutableArray array];
        
        NSArray *array = [JZYIHomeHandler getListData];
        _listMArray = [array mutableCopy];
    }
    return _listMArray;
}

@end
