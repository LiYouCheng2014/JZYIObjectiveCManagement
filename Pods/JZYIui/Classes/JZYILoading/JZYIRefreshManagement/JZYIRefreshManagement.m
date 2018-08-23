//
//  JZYIRefreshManagement.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/30.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIRefreshManagement.h"

#import "JZYIRefreshHeader.h"

@implementation JZYIRefreshManagement
{
    UIScrollView *_tempScrollView;
}

- (instancetype)initWithMainView:(id)mainView {
    if (self = [super init]) {
        _tempScrollView = (UIScrollView *)mainView;
    }
    return self;
}

- (void)headerRefreshFinish:(JZYIRefreshManagementHeaderBlock)block {
    _tempScrollView.mj_header = [JZYIRefreshHeader headerWithRefreshingBlock:^{
        
        block();
        
    }];
}

- (void)endHeaderRefresh {
    [_tempScrollView.mj_header endRefreshing];
}

- (void)immediatelyHeaderRefresh {
    [_tempScrollView.mj_header beginRefreshing];
}

- (void)footerRefreshFinish:(JZYIRefreshManagementFooterBlock)block {
    
    _tempScrollView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        block();
    }];
}

- (void)endFooterRefresh {
    [_tempScrollView.mj_footer endRefreshing];
}

- (void)endFooterNoDataRefresh {
    [_tempScrollView.mj_footer endRefreshingWithNoMoreData];
}

- (void)footerRefreshForNoDataTitle:(NSString *)title
                         withFinish:(JZYIRefreshManagementFooterBlock)block {
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        if (block) {
            block();
        }
    }];
    [footer setTitle:title forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = [UIFont systemFontOfSize:14];
    footer.stateLabel.textColor = [UIColor colorWithHue:152.0/255 saturation:152.0/255 brightness:152.0/255 alpha:1.f];
    _tempScrollView.mj_footer = footer;
}

@end
