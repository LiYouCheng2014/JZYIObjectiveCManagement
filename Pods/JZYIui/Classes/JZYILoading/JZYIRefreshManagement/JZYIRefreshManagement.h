//
//  JZYIRefreshManagement.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/30.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JZYIRefreshManagementHeaderBlock)(void);
typedef void(^JZYIRefreshManagementFooterBlock)(void);

@interface JZYIRefreshManagement : NSObject


- (instancetype)initWithMainView:(id)mainView;

/**
 *  下拉刷新
 *
 *  @param block 回调
 */
- (void)headerRefreshFinish:(JZYIRefreshManagementHeaderBlock)block;

/**
 *  结束下拉刷新
 */
- (void)endHeaderRefresh;

/**
 *  立即下拉刷新
 */
- (void)immediatelyHeaderRefresh;

/**
 *  上拉刷新
 *
 *  @param block 回调
 */
- (void)footerRefreshFinish:(JZYIRefreshManagementFooterBlock)block;

/**
 *  结束上拉刷新
 */
- (void)endFooterRefresh;

/**
 *  进入无数据时提示
 */
- (void)endFooterNoDataRefresh;

/**
 *  无数据时特殊提示上拉刷新
 *
 *  @param title 无数据时特殊提示文字
 *  @param block 回调
 */
- (void)footerRefreshForNoDataTitle:(NSString *)title
                         withFinish:(JZYIRefreshManagementFooterBlock)block;

@end
