//
//  JZYIHomeHandler.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/29.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIHomeHandler.h"

#import "JZYIHomeSectionModel.h"
#import "JZYIHomeRowModel.h"

@implementation JZYIHomeHandler

+ (NSArray *)getListData
{
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 2; i++) {
        JZYIHomeSectionModel *sectionModel = [JZYIHomeSectionModel new];
        
        if (i == 0) {
            JZYIHomeRowModel *blockRowModel = [JZYIHomeRowModel new];
            blockRowModel.name = @"块";
            blockRowModel.pushType = JZYIHomePushTypeBlock;
            
            sectionModel.itemArray = @[ blockRowModel ];
        }
        else if (i == 1) {
            NSArray *tempArray = @[ @"设计模式简介",@"适配器模式",@"策略模式",@"观察者模式",@"原型模式",@"外观模式",@"装饰模式",@"工厂模式",@"抽象工厂模式",@"桥接模式",@"代理模式",@"单例模式",@"备忘录模式" ];
            NSMutableArray *rowMArray = [NSMutableArray array];
            for (NSInteger j = 0; j < [tempArray count]; j++) {
                JZYIHomeRowModel *blockRowModel = [JZYIHomeRowModel new];
                blockRowModel.name = tempArray[j];
                blockRowModel.pushType = JZYIHomePushTypeDesignPattern + j;
                [rowMArray addObject:blockRowModel];
                
                sectionModel.itemArray = rowMArray;
            }
        }
        [mArray addObject:sectionModel];
    }

    
    return mArray;
}

@end
