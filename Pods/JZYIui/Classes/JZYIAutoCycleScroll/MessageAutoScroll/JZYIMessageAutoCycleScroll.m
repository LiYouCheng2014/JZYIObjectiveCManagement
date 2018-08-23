//
//  JZYIViewAutoCycleScroll.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/17.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIMessageAutoCycleScroll.h"

#import "JZYIMessageAutoCycleScrollCell.h"

#define IMAGE_AUTO_TIME 3 //消息自动滚动时间间隔
#define IMAGE_INITIAL_POSITION 0 //图片初始位置

@interface JZYIMessageAutoCycleScroll ()
<JZYIAutoCycleScrollProtocol>

@property (nonatomic, strong) JZYIAutoCycleScroll *autoCycleScroll; //!< 自动循环滚动
@property (nonatomic, assign) JZYIScrollDirection scrollDirection; //!< 滚动方向
@property (nonatomic, assign) JZYIAutoScrollSequence autoScrollSequence; //!< 自动滚动方向

@end

@implementation JZYIMessageAutoCycleScroll

#pragma mark - 1、生命周期函数 life cycle

- (instancetype)initWithScrollDirection:(JZYIScrollDirection)scrollDirection autoScrollSequence:(JZYIAutoScrollSequence)autoScrollSequence
{
    self = [super init];
    if (self) {
        self.scrollDirection = scrollDirection;
        self.autoScrollSequence = autoScrollSequence;
        
        [self addSubview:self.autoCycleScroll];
        
        [self p_setupConstraints];
    }
    return self;
}

#pragma mark - 2、系统代理 system delegate

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - JZYIAutoCycleScrollProtocol

- (UICollectionViewCell *)jzyi_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath object:(id)object
{
    JZYIMessageAutoCycleScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([JZYIMessageAutoCycleScrollCell class]) forIndexPath:indexPath];
    
    NSArray *array = (NSArray *)object;
    [cell refreshUIWithType:[array firstObject] withContent:[array lastObject]];
    
    return cell;
}

- (void)jzyi_didSelectWitObj:(id)obj page:(NSInteger)page {
    if (self.selectBlock) {
        self.selectBlock(obj, page);
    }
}

#pragma mark - 4、相关响应事件 event response

#pragma mark - 5、自定义函数 private methods

- (void)p_setupConstraints
{
    [self.autoCycleScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
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
        
        [_autoCycleScroll registerClass:[JZYIMessageAutoCycleScrollCell class]];
    }
    return _autoCycleScroll;
}

- (void)setSourceArray:(NSArray *)sourceArray {
    _sourceArray = sourceArray;
    
    self.autoCycleScroll.sourceArray = sourceArray;
}

- (void)setAutoScroll:(BOOL)autoScroll {
    self.autoCycleScroll.autoScroll = autoScroll;
}

- (void)setPage:(NSInteger)page {
    self.autoCycleScroll.page = page;
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

@end
