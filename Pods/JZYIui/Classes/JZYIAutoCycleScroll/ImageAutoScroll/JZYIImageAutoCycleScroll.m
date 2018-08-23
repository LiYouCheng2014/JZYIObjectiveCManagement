//
//  JZYIImageAutoCycleScroll.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/17.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIImageAutoCycleScroll.h"

#import <JZYItool/JZYICommon.h>
#import "JZYIImageAutoCycleScrollCell.h"


#define IMAGE_AUTO_TIME 5 //图片自动滚动时间间隔
#define IMAGE_INITIAL_POSITION 0 //图片初始位置

@interface JZYIImageAutoCycleScroll ()
<JZYIAutoCycleScrollProtocol>

@property (nonatomic, strong) JZYIAutoCycleScroll *autoCycleScroll; //!< 自动循环滚动
@property (nonatomic, assign) JZYIScrollDirection scrollDirection; //!< 滚动方向
@property (nonatomic, assign) JZYIAutoScrollSequence autoScrollSequence; //!< 自动滚动方向
@property (nonatomic, strong) JZYIPageControl *pageControl; //!< 小红点

@property (nonatomic, assign) JZYIPageControlAlignment alignment; //!< 小红点方向

@end

@implementation JZYIImageAutoCycleScroll

#pragma mark - 1、生命周期函数 life cycle

- (instancetype)initWithScrollDirection:(JZYIScrollDirection)scrollDirection autoScrollSequence:(JZYIAutoScrollSequence)autoScrollSequence
{
    return [self initWithScrollDirection:scrollDirection autoScrollSequence:autoScrollSequence alignment:JZYIPageControlAlignmentCenter];
}

- (instancetype)initWithScrollDirection:(JZYIScrollDirection)scrollDirection autoScrollSequence:(JZYIAutoScrollSequence)autoScrollSequence alignment:(JZYIPageControlAlignment)alignment
{
    self = [super init];
    if (self) {
        self.scrollDirection = scrollDirection;
        self.autoScrollSequence = autoScrollSequence;
        self.alignment = alignment;
        
        [self addSubview:self.autoCycleScroll];
        [self addSubview:self.pageControl];
        
        [self p_setupConstraints];
    }
    return self;
}

#pragma mark - 2、系统代理 system delegate

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - JZYIAutoCycleScrollProtocol

- (UICollectionViewCell *)jzyi_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath object:(id)object
{
    JZYIImageAutoCycleScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([JZYIImageAutoCycleScrollCell class]) forIndexPath:indexPath];
    [cell refreshUIWithTarget:object placeholderImage:nil];
    
    return cell;
}

- (void)jzyi_didSelectWitObj:(id)obj page:(NSInteger)page {
    if (self.selectBlock) {
        self.selectBlock(obj, page);
    }
}

- (void)jzyi_showViewWithPage:(NSInteger)page
{
    self.pageControl.currentPage = page;
}

#pragma mark - 4、相关响应事件 event response

#pragma mark - 5、自定义函数 private methods

- (void)p_setupConstraints
{
    [self.autoCycleScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@20.f);
    }];
}

/**
 暂停自动滚动
 */
- (void)pauseAutoScroll
{
    [self.autoCycleScroll pauseAutoScroll];
}

/**
 激活自动滚动
 */
- (void)resumeAutoScroll
{
    [self.autoCycleScroll resumeAutoScroll];
}

/**
 移除倒计时
 */
- (void)removeTime
{
    [self.autoCycleScroll removeTime];
}

/**
 显示或者隐藏小红点
 */
- (void)p_pageShowOrHide
{
    self.pageControl.hidden = !(_isShowPage && (_sourceArray.count > 1));
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters

- (JZYIAutoCycleScroll *)autoCycleScroll {
    if (!_autoCycleScroll) {
        _autoCycleScroll = [[JZYIAutoCycleScroll alloc] initWithScrollDirection:self.scrollDirection autoScrollSequence:self.autoScrollSequence];
        _autoCycleScroll.delegate = self;
        _autoCycleScroll.scrollEnable = true;
        _autoCycleScroll.infiniteLoop = true;
        _autoCycleScroll.autoScroll = true;
        _autoCycleScroll.autoScrollTimeInterval = 5;
        _autoCycleScroll.page = 0;
        
        [_autoCycleScroll registerClass:[JZYIImageAutoCycleScrollCell class]];
    }
    return _autoCycleScroll;
}

- (JZYIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [JZYIPageControl setupPageControlWithFrame:CGRectZero dotSize:CGSizeZero dotSpace:0 alignment:self.alignment];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor getColor:@"d81918"];
    }
    return _pageControl;
}

- (void)setSourceArray:(NSArray *)sourceArray {
    _sourceArray = sourceArray;
    
    self.autoCycleScroll.sourceArray = sourceArray;
    self.pageControl.numberOfPages = [sourceArray count];
    
    [self p_pageShowOrHide];
}

- (void)setAutoScroll:(BOOL)autoScroll {
    self.autoCycleScroll.autoScroll = autoScroll;
}

- (void)setPage:(NSInteger)page {
    _page = page;
    self.autoCycleScroll.page = page;
    self.pageControl.currentPage = page;
}

- (void)setAutoScrollTimeInterval:(NSInteger)autoScrollTimeInterval {
    self.autoCycleScroll.autoScrollTimeInterval = autoScrollTimeInterval;
}

- (void)setScrollEnable:(BOOL)scrollEnable {
    self.autoCycleScroll.scrollEnable = scrollEnable;
}

- (void)setInfiniteLoop:(BOOL)infiniteLoop {
    self.autoCycleScroll.infiniteLoop = infiniteLoop;
}

- (void)setIsShowPage:(BOOL)isShowPage {
    _isShowPage = isShowPage;
    
    [self p_pageShowOrHide];
}




//
//
//- (instancetype)initWithFrame:(CGRect)frame
//          withScrollDirection:(JZYIScrollDirection)scrollDirection
//{
//    return [self initWithFrame:frame autoScroll:YES infiniteLoop:YES withScrollDirection:scrollDirection];
//}
//
//- (instancetype)initWithFrame:(CGRect)frame
//                   autoScroll:(BOOL)autoScroll
//                 infiniteLoop:(BOOL)infiniteLoop
//          withScrollDirection:(JZYIScrollDirection)scrollDirection
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//
//        _autoCycleScroll = [[JZYIAutoCycleScroll alloc] initWithFrame:self.bounds
//                                                  withScrollDirection:scrollDirection
//                                               withAutoScrollSequence:JZYIAutoPositiveSequence];
//        _autoCycleScroll.registerBlock = ^(void) {
//            return [JZYIImageAutoCycleScrollCell class];
//        };
//        _autoCycleScroll.cellBlock = ^(UICollectionView * collectionView,NSIndexPath *indexPath,id obj) {
//
//            JZYIImageAutoCycleScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([JZYIImageAutoCycleScrollCell class]) forIndexPath:indexPath];
//
//            if (!cell) {
//                NSLog(@"未创建成功");
//            }
//
//            [cell refreshUIWithString:obj withPlaceholderImage:JZYI_DEFAULT_750_400];
//
//            return cell;
//
//        };
//
//
//        _autoCycleScroll.isEableScroll = YES;
//        _autoCycleScroll.infiniteLoop = infiniteLoop;
//        _autoCycleScroll.autoScroll = autoScroll;
//        _autoCycleScroll.autoScrollTimeInterval = IMAGE_AUTO_TIME;
//        _autoCycleScroll.initialPosition = IMAGE_INITIAL_POSITION;
//
//        [self addSubview:_autoCycleScroll];
//
//        _customPageControl = [[JZYICustomPageControl alloc] initWithFrame:CGRectMake(10, CGRectGetHeight(self.frame) - 20 - 10, CGRectGetWidth(self.frame) - 10 * 2, 20)];
//        _customPageControl.pageIndicatorTintColor = [UIColor whiteColor];
//        _customPageControl.currentPageIndicatorTintColor = [UIColor colorForSpecial];
//        [self addSubview:_customPageControl];
//    }
//    return self;
//}
//
//- (void)setIsPause:(BOOL)isPause {
//    if (isPause) {
//        [_autoCycleScroll pauseAutoScroll];
//    }
//    else {
//        [_autoCycleScroll resumeAutoScroll];
//    }
//}
//
//- (void)setIsPageControl:(BOOL)isPageControl {
//    _customPageControl.hidden = !isPageControl;
//}
//
//- (void)setLayoutFrame:(CGRect)layoutFrame {
//    _layoutFrame = layoutFrame;
//    _autoCycleScroll.layoutFrame = _layoutFrame;
//
//}
//
//- (void)removeTime
//{
//    [_autoCycleScroll removeTime];
//}
//
///**
// 刷新滚动图片资源
//
// @param array 图片资源数组
// */
//- (void)refreshUIWithArray:(NSArray *)array {
//    _customPageControl.numberOfPages = array.count;
//    _customPageControl.location = JZYICustomPageControlLocationRight;
//    [_customPageControl refreshUI];
//
//
//    __weak JZYICustomPageControl *control = _customPageControl;
//    _autoCycleScroll.showPageBlock = ^(NSInteger page){
//        //        NSLog(@"图片 => %ld",(long)page);
//        control.currentPage = page;
//    };
//
//    __weak JZYIImageAutoCycleScroll *weakSelf = self;
//    _autoCycleScroll.selectPageBlock = ^(id obj,NSInteger page){
//        //        NSLog(@"图片 => %ld, %@",(long)page,obj);
//
//        __strong JZYIImageAutoCycleScroll *strongSelf = weakSelf;
//        if (strongSelf.selectBlock) {
//            strongSelf.selectBlock(obj,page);
//        }
//    };
//
//    _customPageControl.hidden = [array count] > 1 ? NO : YES;
//
//    _autoCycleScroll.resourceArray = array;
//    [_autoCycleScroll refreshAutoCycleScroll];
//
//}

@end
