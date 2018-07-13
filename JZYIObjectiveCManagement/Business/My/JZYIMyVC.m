//
//  JZYIMyVC.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIMyVC.h"

#import "JZYIScrollView.h"

@interface JZYIMyVC ()
<UIScrollViewDelegate,
UIGestureRecognizerDelegate>

@property (nonatomic, strong) JZYIScrollView *mainScrollView; //!<
@property (nonatomic, strong) JZYIView *oneSubView; //!<
@property (nonatomic, strong) JZYIView *twoSubView; //!<
@property (nonatomic, strong) JZYIScrollView *threeScrollView; //!<

@end

@implementation JZYIMyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.oneSubView];
    [self.mainScrollView addSubview:self.twoSubView];
    [self.mainScrollView addSubview:self.threeScrollView];
    
    [self p_setupConstraints];
    
    _mainScrollView.contentSize = CGSizeMake(JZYI_SCREEN_WIDTH * 3, 0);
    _threeScrollView.contentSize = CGSizeMake(JZYI_SCREEN_WIDTH * 3, 0);
    
//    self.mainScrollView.panGestureRecognizer.delegate = self;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    pan.delegate = self;
    [self.mainScrollView addGestureRecognizer:pan];
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//        return true;
////        UIPanGestureRecognizer *recognizer = (UIPanGestureRecognizer *)gestureRecognizer;
////        CGFloat currentY = [recognizer translationInView:self.view].y;
////        CGFloat currentX = [recognizer translationInView:self.view].x;
////
////        if (currentY == 0.0) {
////            return YES;
////        } else {
////            if (fabs(currentX)/currentY >= 5.0) {
////                return YES;
////            } else {
////                return NO;
////            }
////        }
//    }
//    return false;
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return true;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == self.mainScrollView) {
//        self.mainScrollView
//    }
//    if scrollView == mainScrollView {
//        if scrollView.contentOffset.y >= maxOffsetY {
//            scrollView.setContentOffset(CGPoint(x: 0, y: maxOffsetY), animated: false)
//            mainScrollView.isScrollEnabled = false
//            subScrollView.isScrollEnabled = true
//            subScrollEnabled = true
//            mainScrollEnabled = false
//        }
//    }else {
//        if scrollView.contentOffset.y <= 0 {
//            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
//            subScrollView.isScrollEnabled = false
//            mainScrollView.isScrollEnabled = true
//            mainScrollEnabled = true
//            subScrollEnabled = false
//        }
//    }
    

}

- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)recognizer {

}

//
//- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)recognizer {
//
//    if (recognizer.state != UIGestureRecognizerStateChanged) {
//        self.mainScrollView.scrollEnabled = false;
//        self.threeScrollView.scrollEnabled = false;
//    }
//    else {
//        CGFloat x = [recognizer translationInView:self.mainScrollView].x;
//        JZYILog(@"===>%f",x);
//        if (self.mainScrollView.scrollEnabled || self.threeScrollView.scrollEnabled) {
//
//        }
//    }
////
//
//
//
////    CGFloat x = [recognizer translationInView:self.view].x;
////    JZYILog(@"====>%f",x);
////    self.mainScrollView.contentOffset = CGPointMake(x, self.mainScrollView.frame.origin.y);
////    switch (recognizer.state) {
////        case UIGestureRecognizerStateBegan:
////            currentScorllY = self.mainScrollView.contentOffset.y;
////            CGFloat currentY = [recognizer translationInView:self.view].y;
////            CGFloat currentX = [recognizer translationInView:self.view].x;
////
////            if (currentY == 0.0) {
////                isVertical = NO;
////            } else {
////                if (fabs(currentX)/currentY >= 5.0) {
////                    isVertical = NO;
////                } else {
////                    isVertical = YES;
////                }
////            }
////            [self.animator removeAllBehaviors];
////            break;
////        case UIGestureRecognizerStateChanged:
////        {
////            //locationInView:获取到的是手指点击屏幕实时的坐标点；
////            //translationInView：获取到的是手指移动后，在相对坐标中的偏移量
////
////            if (isVertical) {
////                //往上滑为负数，往下滑为正数
////                CGFloat currentY = [recognizer translationInView:self.view].y;
////                [self controlScrollForVertical:currentY AndState:UIGestureRecognizerStateChanged];
////            }
////        }
////            break;
////        case UIGestureRecognizerStateCancelled:
////
////            break;
////        case UIGestureRecognizerStateEnded:
////        {
////
////            if (isVertical) {
////                self.dynamicItem.center = self.view.bounds.origin;
////                //velocity是在手势结束的时候获取的竖直方向的手势速度
////                CGPoint velocity = [recognizer velocityInView:self.view];
////                UIDynamicItemBehavior *inertialBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.dynamicItem]];
////                [inertialBehavior addLinearVelocity:CGPointMake(0, velocity.y) forItem:self.dynamicItem];
////                // 通过尝试取2.0比较像系统的效果
////                inertialBehavior.resistance = 2.0;
////                __block CGPoint lastCenter = CGPointZero;
////                __weak typeof(self) weakSelf = self;
////                inertialBehavior.action = ^{
////                    if (isVertical) {
////                        //得到每次移动的距离
////                        CGFloat currentY = weakSelf.dynamicItem.center.y - lastCenter.y;
////                        [weakSelf controlScrollForVertical:currentY AndState:UIGestureRecognizerStateEnded];
////                    }
////                    lastCenter = weakSelf.dynamicItem.center;
////                };
////                [self.animator addBehavior:inertialBehavior];
////                self.decelerationBehavior = inertialBehavior;
////            }
////        }
////            break;
////        default:
////            break;
////    }
//    //保证每次只是移动的距离，不是从头一直移动的距离
////    [recognizer setTranslation:CGPointZero inView:self.view];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == self.mainScrollView) {
//
//    }
//    else if (scrollView == self.threeScrollView) {
//
//    }
//}

- (void)p_setupConstraints
{
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(JZYI_SCREEN_WIDTH, 150));
        make.center.equalTo(self.view);
    }];
    
    [self.oneSubView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.mainScrollView);
        make.centerY.equalTo(self.mainScrollView.mas_centerY);
        make.centerX.equalTo(self.mainScrollView.mas_centerX).offset(0);
    }];
    
    [self.twoSubView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.mainScrollView);
        make.centerY.equalTo(self.mainScrollView.mas_centerY);
        make.centerX.equalTo(self.mainScrollView.mas_centerX).offset(JZYI_SCREEN_WIDTH);
    }];
    
    [self.threeScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.mainScrollView);
        make.centerY.equalTo(self.mainScrollView.mas_centerY);
        make.centerX.equalTo(self.mainScrollView.mas_centerX).offset(JZYI_SCREEN_WIDTH * 2);
    }];
}

- (JZYIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        _mainScrollView = [JZYIScrollView setupScrollViewWithFrame:CGRectZero];
        _mainScrollView.backgroundColor = [UIColor greenColor];
        _mainScrollView.pagingEnabled = true;
        _mainScrollView.scrollEnabled = false;
    }
    return _mainScrollView;
}

- (JZYIScrollView *)threeScrollView {
    if (!_threeScrollView) {
        _threeScrollView = [JZYIScrollView setupScrollViewWithFrame:CGRectZero];
        _threeScrollView.backgroundColor = [UIColor redColor];
        _threeScrollView.scrollEnabled = false;
    }
    return _threeScrollView;
}

- (JZYIView *)oneSubView {
    if (!_oneSubView) {
        _oneSubView = [JZYIView setupViewWithFrame:CGRectZero backgroundColr:[UIColor purpleColor] borderWidth:0 borderColor:nil cornerRadius:0];
    }
    return _oneSubView;
}

- (JZYIView *)twoSubView {
    if (!_twoSubView) {
        _twoSubView = [JZYIView setupViewWithFrame:CGRectZero backgroundColr:[UIColor yellowColor] borderWidth:0 borderColor:nil cornerRadius:0];
    }
    return _twoSubView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
