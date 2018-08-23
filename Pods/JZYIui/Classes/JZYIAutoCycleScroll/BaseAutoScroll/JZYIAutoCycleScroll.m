//
//  JZYIAutoCycleScroll.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/16.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIAutoCycleScroll.h"

@interface JZYIAutoCycleScroll ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UIScrollViewDelegate,
UICollectionViewDelegateFlowLayout>

//主视图
@property (nonatomic, strong) UICollectionView *collectionView;
//数据源
@property (nonatomic, strong) NSMutableArray *dataMArray;

//定时器
@property (nonatomic, strong) NSTimer *autoTimer;
//当前页码
@property (nonatomic, assign) NSInteger currentPage;

//滚动方向
@property (nonatomic, assign) JZYIScrollDirection scrollDirection;
//自动滚动方向
@property (nonatomic, assign) JZYIAutoScrollSequence autoScrollSequence;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation JZYIAutoCycleScroll


#pragma mark - 1、生命周期函数 life cycle

- (instancetype)initWithScrollDirection:(JZYIScrollDirection)scrollDirection autoScrollSequence:(JZYIAutoScrollSequence)autoScrollSequence
{
    self = [super init];
    if (self) {
        self.scrollDirection    = scrollDirection;
        self.autoScrollSequence = autoScrollSequence;
        self.currentPage = -1;

        [self addSubview:self.collectionView];
        
        [self p_setupConstraints];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.collectionView reloadData];
    
    [self p_setupPage];
}

//解决当父View释放时，当前视图因为被Timer强引用而不能释放的问题
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview && self.autoTimer) {
        [self.autoTimer invalidate];
        self.autoTimer = nil;
    }
}

//解决当timer释放后 回调scrollViewDidScroll时访问野指针导致崩溃
- (void)dealloc {
    if (self.collectionView) {
        self.collectionView.delegate = nil;
        self.collectionView.dataSource = nil;
    }
}

#pragma mark - 2、系统代理 system delegate

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataMArray count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < [self.dataMArray count]) {
        if (_delegate && [_delegate respondsToSelector:@selector(jzyi_collectionView:cellForItemAtIndexPath:object:)]) {
            return [_delegate jzyi_collectionView:collectionView cellForItemAtIndexPath:indexPath object:self.dataMArray[indexPath.row]];
        }
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < [self.dataMArray count]) {
        if (_delegate && [_delegate respondsToSelector:@selector(jzyi_didSelectWitObj:page:)]) {
            [_delegate jzyi_didSelectWitObj:self.dataMArray[indexPath.row] page:self.currentPage];
        }
    }
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //    NSLog(@"scrollViewDidEndDragging");

    if (!decelerate) {

    }

    [self p_addTimer];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //    JZYILog(@"scrollViewWillBeginDragging");
    [self removeTime];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //    JZYILog(@"scrollViewDidEndDecelerating");

    [self p_setScrollViewOffset:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    //    NSLog(@"scrollViewDidEndScrollingAnimation");

    [self p_setScrollViewOffset:scrollView];
}

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - 4、相关响应事件 event response

#pragma mark - 5、自定义函数 private methods

- (void)p_setupConstraints
{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
    }];
}

- (void)registerClass:(nullable Class)cellClass
{
    [_collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

//偏移设置
- (void)p_setScrollViewOffset:(UIScrollView *)scrollView {
    
    if (self.scrollDirection == JZYIScrollDirectionHorizontal) {
        
        NSInteger page = (NSInteger)scrollView.contentOffset.x / CGRectGetWidth(self.collectionView.frame);
        
        if (_infiniteLoop && [_sourceArray count] > 1) {
            if (page == 0) {
                [self.collectionView setContentOffset:CGPointMake(CGRectGetWidth(self.collectionView.frame) * (self.dataMArray.count - 2), 0) animated:NO];
                self.currentPage = (NSInteger)scrollView.contentOffset.x / CGRectGetWidth(self.collectionView.frame);
                
            }
            else if (page == self.dataMArray.count - 1) {
                [self.collectionView setContentOffset:CGPointMake(CGRectGetWidth(self.collectionView.frame) * 1, 0) animated:NO];
                self.currentPage = (NSInteger)scrollView.contentOffset.x / CGRectGetWidth(self.collectionView.frame);
                
            }
            else {
                self.currentPage = page;
                
            }
        }
        else {
            self.currentPage = page;
        }
    }
    else {
        NSInteger page = (NSInteger)scrollView.contentOffset.y / CGRectGetHeight(self.collectionView.frame);
        
        if (_infiniteLoop && [_sourceArray count] > 1) {
            if (page == 0) {
                [self.collectionView setContentOffset:CGPointMake(0, CGRectGetHeight(self.collectionView.frame) * (self.dataMArray.count - 2)) animated:NO];
                self.currentPage = (NSInteger)scrollView.contentOffset.y / CGRectGetHeight(self.collectionView.frame);
                
            }
            else if (page == self.dataMArray.count - 1) {
                [self.collectionView setContentOffset:CGPointMake(0, CGRectGetHeight(self.collectionView.frame) * 1) animated:NO];
                self.currentPage = (NSInteger)scrollView.contentOffset.y / CGRectGetHeight(self.collectionView.frame);
                
            }
            else {
                self.currentPage = page;
                
            }
        }
        else {
            self.currentPage = page;
        }
    }
    
    
    if (_infiniteLoop && [_sourceArray count] > 1) {
        [self p_showPage:self.currentPage - 1];
    }
    else {
        [self p_showPage:self.currentPage];
    }
    
}

//显示页码
- (void)p_showPage:(NSInteger)page
{
    NSLog(@"%@=>p_showPage => %ld",self.autoTimer,(long)page);
    if (_delegate && [_delegate respondsToSelector:@selector(jzyi_showViewWithPage:)]) {
        [_delegate jzyi_showViewWithPage:page];
    }
}

//数据源处理
- (void)p_dataHandle
{
    [self.dataMArray removeAllObjects];
    [self.dataMArray addObjectsFromArray:_sourceArray];
    
    //滚动->循环滚动->自动循环滚动
    //能循环&数量大于1
    if (_scrollEnable && (_infiniteLoop && [_sourceArray count] > 1)) {
        //    3 - 1 - 2 - 3 - 1
        [self.dataMArray insertObject:[_sourceArray lastObject] atIndex:0];
        [self.dataMArray addObject:[_sourceArray firstObject]];
    }
    
    self.collectionView.scrollEnabled = _scrollEnable;
    
    [self.collectionView reloadData];
    
    [self p_setupPage];
    [self p_addTimer];
}

//添加倒计时
- (void)p_addTimer
{
    [self removeTime];
    
    //滚动->循环滚动->自动循环滚动
    //能循环&数量大于1
    //自动滚动
    if (_scrollEnable && (_infiniteLoop && [_sourceArray count] > 1) && _autoScroll) {
        self.autoTimer = [NSTimer scheduledTimerWithTimeInterval:_autoScrollTimeInterval
                                                          target:self
                                                        selector:@selector(p_autoScroll)
                                                        userInfo:nil
                                                         repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.autoTimer forMode:NSRunLoopCommonModes];
    }
}

//自动滚动
- (void)p_autoScroll
{
    CGPoint point = self.collectionView.contentOffset;
    
    if (_scrollDirection == JZYIScrollDirectionHorizontal) {
        if (_autoScrollSequence == JZYIAutoScrollSequencePositive) {
            //从左到右
            point.x += CGRectGetWidth(self.collectionView.frame);
        }
        else {
            point.x -= CGRectGetWidth(self.collectionView.frame);
        }
        
        point.x = (NSInteger)(point.x / CGRectGetWidth(self.collectionView.frame)) * CGRectGetWidth(self.collectionView.frame);
    }
    else {
        //垂直
        if (_autoScrollSequence == JZYIAutoScrollSequencePositive) {
            //从上到下
            point.y += CGRectGetHeight(self.collectionView.frame);
        }
        else {
            point.y -= CGRectGetHeight(self.collectionView.frame);
        }
        
        point.y = (NSInteger)(point.y / CGRectGetHeight(self.collectionView.frame)) * CGRectGetHeight(self.collectionView.frame);
    }
    
    [self.collectionView setContentOffset:point animated:YES];
}

//初始化页码
- (void)p_setupPage
{
    if (self.scrollDirection == JZYIScrollDirectionHorizontal) {
        if (_infiniteLoop && [_sourceArray count] > 1) {
            [self.collectionView setContentOffset:CGPointMake(CGRectGetWidth(self.collectionView.frame) * (_page + 1), 0) animated:NO];
        }
        else {
            [self.collectionView setContentOffset:CGPointMake(CGRectGetWidth(self.collectionView.frame) * _page,0) animated:NO];
        }
    }
    else {
        if (_infiniteLoop && [_sourceArray count] > 1) {
            [self.collectionView setContentOffset:CGPointMake(0, CGRectGetHeight(self.collectionView.frame) * (_page + 1)) animated:NO];
        }
        else {
            [self.collectionView setContentOffset:CGPointMake(0, CGRectGetHeight(self.collectionView.frame) * (_page)) animated:NO];
        }
    }
    
    [self p_showPage:self.page];
}

/**
 移除倒计时
 */
- (void)removeTime
{
    if (self.autoTimer) {
        [self.autoTimer invalidate];
        self.autoTimer = nil;
    }
}

/**
 暂停自动滚动
 */
- (void)pauseAutoScroll
{
    if (!_autoTimer || ![_autoTimer isValid]) {
        return ;
    }

    if (_scrollEnable && (_infiniteLoop && [_sourceArray count] > 1) && _autoScroll) {
        [_autoTimer setFireDate:[NSDate distantFuture]];
    }
}

/**
 激活自动滚动
 */
- (void)resumeAutoScroll
{
    if (!_autoTimer || ![_autoTimer isValid]) {
        return ;
    }
    
    if (_scrollEnable && (_infiniteLoop && [_sourceArray count] > 1) && _autoScroll) {
        [_autoTimer setFireDate:[NSDate date]];
    }
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        if (self.scrollDirection == JZYIScrollDirectionHorizontal) {
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        }
        else {
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        }
        _flowLayout.minimumLineSpacing       = 0;
        _flowLayout.minimumInteritemSpacing  = 0;
        _flowLayout.sectionInset             = UIEdgeInsetsZero;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.pagingEnabled    = YES;
        _collectionView.delegate         = self;
        _collectionView.dataSource       = self;
        _collectionView.pagingEnabled    = YES;
        _collectionView.bounces          = NO;
        _collectionView.backgroundColor  = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator     = NO;
        _collectionView.showsHorizontalScrollIndicator   = NO;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    }
    return _collectionView;
}

- (NSMutableArray *)dataMArray {
    if (!_dataMArray) {
        _dataMArray = [NSMutableArray array];
    }
    return _dataMArray;
}

- (void)setSourceArray:(NSArray *)sourceArray {
    _sourceArray = sourceArray;
    
    [self p_dataHandle];
}

- (void)setScrollEnable:(BOOL)scrollEnable {
    _scrollEnable = scrollEnable;
    
    [self p_dataHandle];
}

- (void)setAutoScroll:(BOOL)autoScroll {
    _autoScroll = autoScroll;
    
    [self p_dataHandle];
}

- (void)setInfiniteLoop:(BOOL)infiniteLoop {
    _infiniteLoop = infiniteLoop;
    
    [self p_dataHandle];
}

- (void)setPage:(NSInteger)page {
    _page = page;
    
    [self p_setupPage];
}

- (void)setAutoScrollTimeInterval:(NSInteger)autoScrollTimeInterval {
    _autoScrollTimeInterval = autoScrollTimeInterval;
    
    [self p_dataHandle];
}

@end
