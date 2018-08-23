//
//  JZYILookImageView.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/18.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIView.h"

#import "JZYIBasicUI.h"

@protocol JZYILookImageViewDelegate <NSObject>
@optional
//删除图片
- (void)deleteImageWithIndex:(NSInteger)index;

@end

@interface JZYILookImageView : JZYIView

@property (nonatomic, weak) id<JZYILookImageViewDelegate> delegate;


/**
 是否显示删除按钮
 */
@property (nonatomic, assign) BOOL showDelete;

/**
 隐藏图片浏览器
 */
- (void)hideView;

/**
 显示图片浏览器
 */
- (void)showView;

/**
 *  刷新查看图片
 *
 *  @param array 资源 包含QJKJImageView
 *  @param index  默认页
 */
- (void)refreshUIWithArray:(NSArray <JZYIImageView *> *)array
                 withIndex:(NSInteger)index;

@end
