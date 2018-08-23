//
//  JZYIImageScrollView.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/18.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIScrollView.h"

#import "JZYIBasicUI.h"

@protocol ImgScrollViewDelegate <NSObject>

- (void) tapImageViewTappedWithObject:(id) sender;

@end

@interface JZYIImageScrollView : JZYIScrollView<UIScrollViewDelegate>
{
    UIImageView *imgView;
    
    //记录自己的位置
    CGRect scaleOriginRect;
    
    //图片的大小
    CGSize imgSize;
    
    //缩放前大小
    CGRect initRect;
}

@property (weak) id<ImgScrollViewDelegate> i_delegate;
//内容宽度
- (void)setContentWithFrame:(CGRect) rect;
//当前图片
- (void)setImage:(UIImage *) image;
//动画frame
- (void)setAnimationRect;
//初始化
- (void)rechangeInitRdct;

@end
