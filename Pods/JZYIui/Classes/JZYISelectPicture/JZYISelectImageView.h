//
//  JZYISelectImageView.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/18.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JZYISelectImageViewDelegate <NSObject>
@optional;
/**
 选择图片结果

 @param array 图片数组
 */
- (void)jzyi_addSelectImageArray:(NSArray<UIImage *> *)array;

@end

@interface JZYISelectImageView : UIView

// 切割比例 默认自动缩放
@property (nonatomic, assign) CGFloat   scale;
// 是否用户编辑图片 默认 YES
@property (nonatomic, assign) BOOL      isUserEdit;
// 用户可以选择的数量
@property (nonatomic, assign) NSInteger maxNum;

/**
 显示

 @param delegate 代理
 */
- (void)showView:(id<JZYISelectImageViewDelegate>)delegate;

/**
 隐藏
 */
- (void)hideView;

@end
