//
//  JZYIHomeRowModel.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/29.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JZYIHomePushType) {
    JZYIHomePushTypeBlock = 1,//块
    
    JZYIHomePushTypeDesignPattern = 30,//设计模式简介
    JZYIHomePushTypeDesignAdapter = 31,//适配器模式
    JZYIHomePushTypeDesignStrategy = 32,//策略模式
    JZYIHomePushTypeDesignObserver = 33, //观察者
    JZYIHomePushTypeDesignPrototype = 34,//原型模式
    JZYIHomePushTypeDesignAppearance = 35,//外观模式
    JZYIHomePushTypeDesignDecorate = 36,//装饰模式
    JZYIHomePushTypeDesignFactory = 37,//工厂模式
    JZYIHomePushTypeDesignAbstractFactory = 38,//抽象工厂模式
    JZYIHomePushTypeDesignBridging = 39,//桥接模式
    JZYIHomePushTypeDesignDelegate = 40, //代理模式
    JZYIHomePushTypeDesignSigle = 41,//单例模式
    JZYIHomePushTypeDesignMemo = 42,//备忘录模式
    JZYIHomePushTypeDesignBuilder = 43,//生成器模式
};

@interface JZYIHomeRowModel : NSObject

@property (nonatomic, assign) JZYIHomePushType pushType ; //!< 跳转类型
@property (nonatomic, copy) NSString *name; //!< 名字

@end
