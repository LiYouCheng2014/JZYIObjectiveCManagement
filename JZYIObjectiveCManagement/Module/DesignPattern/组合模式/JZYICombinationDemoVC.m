//
//  JZYICombinationDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYICombinationDemoVC.h"

#import "File.h"
#import "FileCell.h"
@interface JZYICombinationDemoVC ()
<UITableViewDelegate,
UITableViewDataSource>

//@property (nonatomic, strong) Node *rootNode; //!< 根节点

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) File        *root;

@end

@implementation JZYICombinationDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"Root";
    
    // 创建根节点
    self.root = [File fileWithFileType:kFolder fileName:@"root"];
    
    // 创建第一级文件
    File *folder_A_1 = [File fileWithFileType:kFolder fileName:@"Folder-A-1"];
    File *file_A_2   = [File fileWithFileType:kFile fileName:@"File-A-2"];
    File *file_A_3   = [File fileWithFileType:kFile fileName:@"File-A-3"];
    File *file_A_4   = [File fileWithFileType:kFile fileName:@"File-A-4"];
    
    // 创建第二级文件
    File *folder_B_1 = [File fileWithFileType:kFolder fileName:@"Folder-B-1"];
    File *file_B_2   = [File fileWithFileType:kFile fileName:@"File-B-2"];
    File *file_B_3   = [File fileWithFileType:kFile fileName:@"File-B-3"];
    File *folder_B_2 = [File fileWithFileType:kFolder fileName:@"Folder-B-2"];
    
    // 创建第三级文件
    File *folder_C_1 = [File fileWithFileType:kFolder fileName:@"Folder-C-1"];
    File *file_C_1   = [File fileWithFileType:kFile fileName:@"File-C-1"];
    File *file_C_2   = [File fileWithFileType:kFile fileName:@"File-C-2"];
    
    [self.root addFile:folder_A_1];
    [self.root addFile:file_A_2];
    [self.root addFile:file_A_3];
    [self.root addFile:file_A_4];
    
    [folder_A_1 addFile:folder_B_1];
    [folder_A_1 addFile:file_B_2];
    [folder_A_1 addFile:file_B_3];
    [folder_A_1 addFile:folder_B_2];
    
    [folder_B_1 addFile:folder_C_1];
    [folder_B_1 addFile:file_C_1];
    [folder_B_2 addFile:file_C_2];
    
    [self initTableView];
    
//    self.rootNode = [Node nodeWithNodeName:@"A"];
//
//    Node *c = [Node nodeWithNodeName:@"C"];
//    [self.rootNode addNode:[Node nodeWithNodeName:@"B"]];
//    [self.rootNode addNode:c];
//    [self.rootNode addNode:[Node nodeWithNodeName:@"D"]];
//
//    [c addNode:[Node nodeWithNodeName:@"E"]];
//    [c addNode:[Node nodeWithNodeName:@"F"]];
//
//    NSLog(@"%@",self.rootNode.childNodes);
//    NSLog(@"%@",c.childNodes);
//    self.rootNode = [Node nodeWithName:@"A"];
//
//    [self insertNodeTree:self.rootNode node:[Node nodeWithName:@"B"]];
//    [self insertNodeTree:self.rootNode node:[Node nodeWithName:@"C"]];
//    [self insertNodeTree:self.rootNode node:[Node nodeWithName:@"D"]];
//    [self insertNodeTree:self.rootNode node:[Node nodeWithName:@"E"]];
//    [self insertNodeTree:self.rootNode node:[Node nodeWithName:@"F"]];
//
//    [self treeInfomationWithNode:self.rootNode];
}


#pragma mark - tableView相关
- (void)initTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate       = self;
    self.tableView.dataSource     = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[FileCell class] forCellReuseIdentifier:@"fileCell"];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.root.childFiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FileCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"fileCell"];
    cell.indexPath  = indexPath;
    cell.tableView  = tableView;
    cell.controller = self;
    
    // 传入节点File
    cell.data       = self.root.childFiles[indexPath.row];
    
    [cell loadContent];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80.f;
}

//
////往根节点插入节点
//- (void)insertNodeTree:(Node *)tree node:(Node *)node {
//    if (tree.leftNode == nil) {
//        tree.leftNode = node;
//        return;
//    }
//    
//    if (tree.rightNode == nil) {
//        tree.rightNode = node;
//        return;
//    }
//    
//    [self insertNodeTree:tree.leftNode node:node];
//}
//
////便利二叉树
//- (void)treeInfomationWithNode:(Node *)node {
//    if (node.leftNode) {
//        [self treeInfomationWithNode:node.leftNode];
//    }
//    
//    NSLog(@"%@\n",node.nodeName);;
//    
//    if (node.rightNode) {
//        [self treeInfomationWithNode:node.rightNode];
//    }
//    
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
