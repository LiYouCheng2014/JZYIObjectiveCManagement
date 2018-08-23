//
//  JZYIPageControl.m
//  JZYICommonUI
//
//  Created by liyoucheng on 2018/5/28.
//

#import "JZYIPageControl.h"
//
//static CGFloat kDotWidth = 10.f;
//static CGFloat kDotHeight = 10.f;
//static CGFloat kDotMagrin = 8.f;

@interface JZYIPageControl ()

@property (nonatomic, assign) CGSize dotSize; //!<
@property (nonatomic, assign) CGFloat dotSpace; //!<
@property (nonatomic, assign) JZYIPageControlAlignment alignment; //!< 位置

@end

@implementation JZYIPageControl

- (instancetype)initWithSize:(CGSize)size space:(CGFloat)space alignment:(JZYIPageControlAlignment)alignment {
    self = [super init];
    if (self) {
        self.userInteractionEnabled = false;
        
        _dotSize = size.width > 5 ? size : CGSizeMake(8.f, 8.f);
        _dotSpace = space > 1 ? space : 8.f;
        _alignment = alignment;
    }
    return self;
}

- (instancetype)initWithSize:(CGSize)size space:(CGFloat)space
{
    return [self initWithSize:size space:space alignment:JZYIPageControlAlignmentCenter];
}

+ (instancetype)setupPageControlWithFrame:(CGRect)frame dotSize:(CGSize)dotSize dotSpace:(CGFloat)dotSpace alignment:(JZYIPageControlAlignment)alignment
{
    JZYIPageControl *pageControl = [[JZYIPageControl alloc] initWithSize:dotSize space:dotSpace alignment:alignment];
    pageControl.frame = frame;
    return pageControl;
}

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//
//    }
//    return self;
//}
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.userInteractionEnabled = false;
//    }
//    return self;
//}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //计算圆点间距
    CGFloat marginX = self.dotSize.width + self.dotSpace;
    
    CGFloat startX = 0;
    switch (_alignment) {
        case JZYIPageControlAlignmentLeft:
            startX = 15.f;
            break;
        case JZYIPageControlAlignmentCenter:
            startX = (CGRectGetWidth(self.frame) -  self.subviews.count * marginX + self.dotSpace) / 2.0;
            break;
        case JZYIPageControlAlignmentRight:
            startX = (CGRectGetWidth(self.frame) - 15.f - self.subviews.count * marginX + self.dotSpace);
            break;
    }
    

    //遍历subview,设置圆点frame
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.layer.cornerRadius = self.dotSize.width / 2.0;
        if (idx == self.currentPage) {
            [obj setFrame:CGRectMake(startX + idx * marginX, obj.frame.origin.y, self.dotSize.width, self.dotSize.height)];
        }else {
            [obj setFrame:CGRectMake(startX + idx * marginX, obj.frame.origin.y, self.dotSize.width, self.dotSize.height)];
        }
    }];
}

//
//- (void)setCurrentPage:(NSInteger)currentPage {
//    [super setCurrentPage:currentPage];
//
//    [self.subviews enumerateObjectsUsingBlock:^(UIView *imageView, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        CGSize size;
//        size.height = 20.f;
//        size.width = 20.f;
//
//        [imageView setFrame:CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y,
//
//                                     size.width,size.height)];
//        [imageView.layer setCornerRadius:size.height/2.0];
//
////        if (idx == currentPage)
////
////            //        subview.image =[UIImage imageNamed:@"60.png"];
////        {    imageView.layer.cornerRadius = 0;
////            imageView.layer.masksToBounds = YES;
////        }
////        else
////        {    //subview.image =[UIImage imageNamed:@"60.png"];
////            imageView.layer.cornerRadius = 0;
////            imageView.layer.masksToBounds = YES;
////
////        }
//    }];
//
//}

@end
