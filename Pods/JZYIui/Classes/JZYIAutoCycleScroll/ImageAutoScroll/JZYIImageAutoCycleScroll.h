//
//  JZYIImageAutoCycleScroll.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/17.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIBasicUI.h"

#import "JZYIAutoCycleScroll.h"
#import "JZYIPageControl.h"

/**
 点击某张图片

 @param obj 图片对象
 @param page 页码
 */
typedef void(^JZYIImageAutoCycleScrollSelectBlock)(id obj,NSInteger page);

@interface JZYIImageAutoCycleScroll : JZYIView

@property (nonatomic, strong) NSArray *sourceArray; //!< 源数据

@property (nonatomic, assign) BOOL scrollEnable; //!< 是否能滚动 默认-是
@property (nonatomic, assign) BOOL infiniteLoop; //!< 是否循环滚动 默认-是
@property (nonatomic, assign) BOOL autoScroll; //!< 是否自动滚动 默认-是
@property (nonatomic, assign) NSInteger autoScrollTimeInterval; //!< 自动滚动时间间隔 默认-5s
@property (nonatomic, assign) NSInteger page;

@property (nonatomic, assign) BOOL isShowPage; //!< 是否显示小红点

@property (nonatomic, copy) JZYIImageAutoCycleScrollSelectBlock selectBlock; //!< 点击图片块


- (instancetype)initWithScrollDirection:(JZYIScrollDirection)scrollDirection autoScrollSequence:(JZYIAutoScrollSequence)autoScrollSequence;

- (instancetype)initWithScrollDirection:(JZYIScrollDirection)scrollDirection autoScrollSequence:(JZYIAutoScrollSequence)autoScrollSequence alignment:(JZYIPageControlAlignment)alignment;
/**
 暂停自动滚动
 */
- (void)pauseAutoScroll;

/**
 激活自动滚动
 */
- (void)resumeAutoScroll;

/**
 移除倒计时
 */
- (void)removeTime;

@end
