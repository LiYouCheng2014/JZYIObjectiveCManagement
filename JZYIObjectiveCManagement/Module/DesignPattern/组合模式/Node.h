//
//  Node.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

//@property (nonatomic, strong) Node *leftNode; //!< 左节点
//@property (nonatomic, strong) Node *rightNode; //!< 右节点
@property (nonatomic, strong) NSString *nodeName; //!< 当前节点名字

@property (nonatomic, strong, readonly) NSMutableArray <Node *> *childNodes; //!< 子节点集合

//添加子节点
- (void)addNode:(Node *)node;

//删除子节点
- (void)removeNode:(Node *)node;

//获取子节点
- (Node *)nodeIndex:(NSInteger)index;

//具体操作
- (void)operation;

//便利构造器
+ (instancetype)nodeWithNodeName:(NSString *)nodeName;

@end

