//
//  Node.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "Node.h"

@interface Node ()

@property (nonatomic, strong) NSMutableArray <Node *> *childNodes; //!< 子节点集合

@end

@implementation Node

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.childNodes = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)nodeWithNodeName:(NSString *)nodeName
{
    //有可能子类继承，所以用self
    Node *node = [[[self class] alloc] init];
    node.nodeName = nodeName;
    
    return node;
}

//添加子节点
- (void)addNode:(Node *)node
{
    [self.childNodes addObject:node];
}

//删除子节点
- (void)removeNode:(Node *)node
{
    [self.childNodes removeObject:node];
}

//获取子节点
- (Node *)nodeIndex:(NSInteger)index
{
    if (index < [self.childNodes count]) {
        Node *node = self.childNodes[index];
        return node;
    }
    else {
        return nil;
    }
}

//具体操作
- (void)operation {
    NSLog(@"%@",self.nodeName);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"[Node] - %@",self.nodeName];
}

//+ (instancetype)nodeWithName:(NSString *)nodeName
//{
//    //有可能子类继承，所以用self
//    Node *node = [[[self class] alloc] init];
//
//    node.nodeName = nodeName;
//
//    return node;
//}

@end
