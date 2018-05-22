//
//  HomeLogic.h
//  ByYourself
//
//  Created by Lin YiPing on 2018/5/14.
//  Copyright © 2018年 LeoFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkingState.h"

//例如这是首页的相关逻辑， NetWorkingState为通用协议，将一些通用的操作方法可以写在改协议中(如加载动画，无数据提示)
@protocol HomeLogic <NetWorkingState>

@optional

//数据解析后的model数组(改方法参数可以为一个处理后的字典)

//- (void)updateViewWithData:(NSDictionary  *)dataDic;

- (void)updateViewWithData:(NSArray *)arr;


//数据请求失败后的操作
- (void)getNetDataFailed;


@end
