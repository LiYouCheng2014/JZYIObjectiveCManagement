//
//  JZYILookImageView.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/18.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYILookImageView.h"

#import "JZYIImageScrollView.h"

#import <JZYItool/JZYIBaseInfo.h>

@interface JZYILookImageView ()
<UIScrollViewDelegate,
ImgScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *lookScrollView;
@property (nonatomic, strong) JZYIPageControl *pageController;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) JZYIButton *deleteButton;

@end

@implementation JZYILookImageView

-(instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.frame = [UIScreen mainScreen].bounds;
        self.showDelete = NO;
        
        [self addSubview:self.lookScrollView];
        [self addSubview:self.pageController];
        
    }
    return self;
}

- (void)showView
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)hideView
{
    [self removeFromSuperview];
}

- (void)refreshUIWithArray:(NSArray <JZYIImageView *> *)array
                 withIndex:(NSInteger)index
{
    if (self.showDelete) {
        [self addSubview:self.deleteButton];
    }
    
    self.currentPage = index > array.count - 1 ? array.count - 1 : index;;
    
    self.lookScrollView.contentSize = CGSizeMake(array.count * [JZYIScreenInfo getCurrentScreenWith], 0);
    self.lookScrollView.contentOffset = CGPointMake(self.currentPage*[JZYIScreenInfo getCurrentScreenWith], 0);
    
    //加载图片,后期优化
    [self.lookScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.pageController.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    self.pageController.numberOfPages = array.count;
    self.pageController.currentPage = self.currentPage;
    
    for (int i = 0; i < array.count; i++) {
        
        JZYIImageView *imageView = array[i];
        
        CGRect newFrame = [[imageView superview] convertRect:imageView.frame toView:self];
        
        JZYIImageScrollView *tmpImgScrollView = [[JZYIImageScrollView alloc] initWithFrame:CGRectMake(self.lookScrollView.width * i, 0, self.lookScrollView.width, self.lookScrollView.height)];
        tmpImgScrollView.tag = 12345+i;
        tmpImgScrollView.i_delegate = self;
        //初始化位置
        [tmpImgScrollView setContentWithFrame:newFrame];
        //改变位置
        [tmpImgScrollView setImage:imageView.image];
        //动画大小
        [tmpImgScrollView setAnimationRect];
        [self.lookScrollView addSubview:tmpImgScrollView];
    }
}

- (void)setOriginFrame:(JZYIImageScrollView *)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        [sender setAnimationRect];
    }];
}

- (void) tapImageViewTappedWithObject:(id)sender
{
    JZYIImageScrollView *tmpImgView = sender;
    
    [UIView animateWithDuration:0.25 animations:^{
        [tmpImgView rechangeInitRdct];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    self.currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageController.currentPage = self.currentPage;
}

- (void)clickedDelete {
    if (_delegate && [_delegate respondsToSelector:@selector(deleteImageWithIndex:)]) {
        [_delegate deleteImageWithIndex:self.currentPage];
    }
}

#pragma mark -

- (UIScrollView *)lookScrollView {
    if (!_lookScrollView) {
        _lookScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _lookScrollView.delegate = self;
        _lookScrollView.bounces = NO;
        _lookScrollView.pagingEnabled = YES;
    }
    return _lookScrollView;
}

- (JZYIPageControl *)pageController {
    if (!_pageController) {
        _pageController = [JZYIPageControl setupPageControlWithFrame:CGRectZero dotSize:CGSizeMake(10, 10) dotSpace:8 alignment:JZYIPageControlAlignmentCenter];
        _pageController.frame = CGRectMake(([JZYIScreenInfo getCurrentScreenWith] - 150)/2, self.height-30, 150, 20);
        _pageController.backgroundColor = [UIColor clearColor];
    }
    return _pageController;
}

- (JZYIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = [JZYIButton buttonWithType:UIButtonTypeCustom];
        _deleteButton.frame = CGRectMake(self.width - 60 - 10, self.height - 10 - 40, 60, 40);
        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        _deleteButton.layer.cornerRadius = 5;
        _deleteButton.clipsToBounds = YES;
        _deleteButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [_deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        _deleteButton.backgroundColor = [JZYIColorHelper colorForButtonRed];
        [_deleteButton addTarget:self action:@selector(clickedDelete) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

@end
