//
//  JZYIHomePushHandler.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/29.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIHomePushHandler.h"

#import "JZYIHomeRowModel.h"

//块使用
#import "JZYIBlockVC.h"


#import "DesignPatternVC.h"
#import "AdapterDemoVC.h"
#import "JZYIStrategyDemoVC.h"
#import "JZYIObserverVC.h"
#import "JZYIPrototypeDemoVC.h"
#import "JZYIAppearanceDemoVC.h"

@implementation JZYIHomePushHandler

+(void)goVCWithTarget:(UIViewController *)target model:(JZYIHomeRowModel *)model
{
    switch (model.pushType) {
        case JZYIHomePushTypeBlock:
        {
            //块
            JZYIBlockVC *vc = [JZYIBlockVC new];
            [target.navigationController pushViewController:vc animated:true];
        }
            break;
        case JZYIHomePushTypeDesignPattern:
        {
            //设计模式简介
            DesignPatternVC *vc = [DesignPatternVC new];
            [target.navigationController pushViewController:vc animated:true];
        }
            break;
        case JZYIHomePushTypeDesignAdapter:
        {
            //适配器模式
            AdapterDemoVC *vc = [AdapterDemoVC new];
            [target.navigationController pushViewController:vc animated:true];
        }
            break;
        case JZYIHomePushTypeDesignStrategy:
        {
            //策略模式
            JZYIStrategyDemoVC *vc = [JZYIStrategyDemoVC new];
            [target.navigationController pushViewController:vc animated:true];
        }
            break;
        case JZYIHomePushTypeDesignObserver:
        {
            //观察者
            JZYIObserverVC *vc = [JZYIObserverVC new];
            [target.navigationController pushViewController:vc animated:true];
        }
            break;
        case JZYIHomePushTypeDesignPrototype:
        {
            //原型模式
            JZYIPrototypeDemoVC *vc = [JZYIPrototypeDemoVC new];
            [target.navigationController pushViewController:vc animated:true];
        }
            break;
        case JZYIHomePushTypeDesignAppearance:
        {
            //外观模式
            JZYIAppearanceDemoVC *vc = [JZYIAppearanceDemoVC new];
            [target.navigationController pushViewController:vc animated:true];
        }
            break;
            
    }
}

@end
