//
//  HomePresent.m
//  ByYourself
//
//  Created by Lin YiPing on 2018/5/14.
//  Copyright © 2018年 LeoFeng. All rights reserved.
//

#import "HomePresent.h"
#import "HomeService.h"
#import "HomeModel.h"

@interface HomePresent ()

//用weak类型不会内存泄露，用strong类型记得用detachView解绑View
@property (nonatomic, weak) id<HomeLogic>view;
@property (nonatomic, strong) HomeService *homeDataServiece;

@end


@implementation HomePresent

/**
 **一个方法只做一个功能
 *
 */

/**从服务器请求数据 */
- (void)fetchData {
    
    //加载动画
    [self.view showLoadingView];
    //请求数组
    [self.homeDataServiece getHomeDataComplete:^(NSDictionary *dict, NSError *error) {
        [self.view hiddenLoadingView];
        [self analysisData:dict];
       
    }];
}

//解析数据
- (void)analysisData:(NSDictionary *)dict {
    
    //成功
    if ([dict[@"status"] integerValue] == 200) {
        HomeModel *model = [[HomeModel alloc] init];
        model.name = dict[@"name"];
        model.time = dict[@"time"];
        if (self.view) {
            [self.view updateViewWithData:@[model]];
        }
    }else {
        //失败
        [self.view getNetDataFailed];
    }
}


//绑定对象
- (void)attachView:(id<HomeLogic>)view {
    self.view = view;
}


//解绑对象
- (void)detachView {
    self.view = nil;
}


//数据请求对象
- (HomeService *)homeDataServiece {
    if (!_homeDataServiece) {
        _homeDataServiece = [[HomeService alloc] init];
    }
    return _homeDataServiece;
}
@end
