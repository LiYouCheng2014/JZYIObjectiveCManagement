//
//  JZYIAutoCycleScroll.h
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/16.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIBasicUI.h"

#import "JZYIAutoCycleScrollProtocol.h"

//!< 滚动方向
typedef NS_ENUM(NSInteger, JZYIScrollDirection) {
    JZYIScrollDirectionVertical = 0, //!< 垂直方向
    JZYIScrollDirectionHorizontal = 1, //!< 水平方向
};

//!< 自动滚动方向顺序 与JZYIScrollDirection有关
typedef NS_ENUM(NSInteger, JZYIAutoScrollSequence) {
    JZYIAutoScrollSequencePositive = 0, //!< 正序 从上到下或从左到右
    JZYIAutoScrollSequenceReverse = 1, //!< 反序 从下到上或从右到左
};


//#pragma mark - 相关回调
//
///**
// 当前页面的页码值返回
//
// @param page 页码值
// */
//typedef void(^JZYIAutoCycleScrollShowPageBlock)(NSInteger page);
//
///**
// 点击当前页面的页码
//
// @param obj 页码值
// */
//typedef void(^JZYIAutoCycleScrollSelectPageBlock)(id obj,NSInteger page);
//
///**
// 自定义cell
//
// @param collectionView 控件
// @param indexPath 位置
// @param obj 数据 不要使用传入的数组资源进行刷新
// @return cell
// */
//typedef UICollectionViewCell*(^JZYIAutoCycleScrollCellBlock)(UICollectionView * collectionView,NSIndexPath *indexPath,id obj);
//
//
///**
// 注册块
//
// @return 注册
// */
//typedef Class(^JZYIAutoCycleScrollRegisterBlock)(void);



@interface JZYIAutoCycleScroll : JZYIView

@property (nonatomic, assign) BOOL scrollEnable; //!< 是否能滚动 默认-是
@property (nonatomic, assign) BOOL infiniteLoop; //!< 是否循环滚动 默认-是
@property (nonatomic, assign) BOOL autoScroll; //!< 是否自动滚动 默认-是
@property (nonatomic, assign) NSInteger autoScrollTimeInterval; //!< 自动滚动时间间隔 默认-5s
@property (nonatomic, assign) NSInteger page; //!< 页码位置 默认-0
@property (nonatomic, strong) NSArray *sourceArray; //!< 源数据

@property (nonatomic, weak) id<JZYIAutoCycleScrollProtocol> delegate; //!< 协议

/**
 便利构造器

 @param scrollDirection 滚动方向
 @param autoScrollSequence 自动滚动方向顺序
 @return 实例对象
 */
- (instancetype)initWithScrollDirection:(JZYIScrollDirection)scrollDirection autoScrollSequence:(JZYIAutoScrollSequence)autoScrollSequence;

/**
 注册cell

 @param cellClass 自定义cell
 */
- (void)registerClass:(nullable Class)cellClass;

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
