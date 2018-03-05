//
//  JZYIImageView.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/26.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JZYIImageView;
@protocol JZYIImageViewDelegate <NSObject>

- (void)clickedImageView:(JZYIImageView *)imageView;

@end


@interface JZYIImageView : UIImageView

+ (instancetype)setupImageViewWithFrame:(CGRect)frame
                                  image:(UIImage *)image;

/**
 图片添加点击事件
 
 @param delegate 代理
 */
- (void)imageAddTap:(id<JZYIImageViewDelegate>)delegate;

@end
