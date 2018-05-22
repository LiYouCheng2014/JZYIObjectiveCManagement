//
//  HomePresent.h
//  ByYourself
//
//  Created by Lin YiPing on 2018/5/14.
//  Copyright © 2018年 LeoFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeLogic.h"

@interface HomePresent : NSObject



/**
 请求数据
 */
- (void)fetchData;


//关联对象
- (void)attachView:(id<HomeLogic>)view;


//取消关联
- (void)detachView;



@end
