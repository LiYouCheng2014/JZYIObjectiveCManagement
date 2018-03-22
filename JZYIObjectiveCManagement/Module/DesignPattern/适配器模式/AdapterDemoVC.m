//
//  AdapterDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "AdapterDemoVC.h"

#import "JZYIBusinessCardView.h"

//数据一
#import "JZYICardModel.h"
#import "JZYICardModelAdapter.h"

//数据二
#import "JZYINewCardModel.h"
#import "JZYINewCardModelAdapter.h"

@interface AdapterDemoVC ()

@property (nonatomic, strong) JZYIBusinessCardView *businessCardView;

@end

@implementation AdapterDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavTitle:@"适配器模式"];
    
    [self.view addSubview:self.businessCardView];
    
//    //数据一
//    JZYICardModel *model = [[JZYICardModel alloc] init];
//    model.name = @"liyouchneg";
//    model.lineColor = [UIColor redColor];
//    model.phoneNumber = @"15302670087";
//
//    //与输入建立联系
//    JZYICardModelAdapter *modelAdapter = [[JZYICardModelAdapter alloc] initWithData:model];
//    //与输出建立联系
//    [self.businessCardView loadData:modelAdapter];
    
    
    //数据二
    JZYINewCardModel *newModel = [[JZYINewCardModel alloc] init];
    newModel.name = @"liyouchneg";
    newModel.colorHexString = @"e2e2b3";
    newModel.phoneNumber = @"15919479503";
    
    JZYINewCardModelAdapter *newModelAdapter = [[JZYINewCardModelAdapter alloc] initWithData:newModel];
    //与输出建立联系
    [self.businessCardView loadData:newModelAdapter];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (JZYIBusinessCardView *)businessCardView {
    if (!_businessCardView) {
        _businessCardView = [[JZYIBusinessCardView alloc] initWithFrame:CGRectZero];
        _businessCardView.center = self.view.center;
    }
    return _businessCardView;
}

@end
