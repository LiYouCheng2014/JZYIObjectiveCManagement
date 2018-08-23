//
//  JZYIMoreImageSelectView.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/18.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIBasicUI.h"

@protocol JZYIMoreImageSelectViewDelegate <NSObject>
@optional
//选择图片变化情况
- (void)selectImageChange:(NSArray *)array;
//结束编辑
- (void)endEdit;

@end

typedef void(^JZYIMoreImageSelectViewHeightBlock)(CGFloat height);

@interface JZYIMoreImageSelectView : JZYIView


//上下左右间隙
@property (nonatomic, assign) UIEdgeInsets edges;
//行距
@property (nonatomic, assign) CGFloat rowSpace;
//列距
@property (nonatomic, assign) CGFloat columnSpace;
//图片大小
@property (nonatomic, assign) CGSize imageSize;
//图片最大数量
@property (nonatomic, assign) NSInteger maxImageCount;
//高度块
@property (nonatomic, copy) JZYIMoreImageSelectViewHeightBlock heightBlock;

@property (nonatomic, weak) id<JZYIMoreImageSelectViewDelegate> delegate;

//多张图片显示
- (void)refreshUIWithArray:(NSArray *)array;

@end
