//
//  NetWorkingState.h
//  ByYourself
//
//  Created by Lin YiPing on 2018/5/14.
//  Copyright © 2018年 LeoFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

//通用协议方法
@protocol NetWorkingState <NSObject>

@optional
/**
 无数据提示
 */
- (void)netWorkingWithNoData;

/**
 菊花提示
 */
- (void)showLoadingView;


/**
 隐藏菊花提示
 */
- (void)hiddenLoadingView;


@end
