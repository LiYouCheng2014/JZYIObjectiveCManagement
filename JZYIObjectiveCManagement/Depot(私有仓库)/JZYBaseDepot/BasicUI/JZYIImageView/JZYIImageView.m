//
//  JZYIImageView.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/10/26.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIImageView.h"

#import "UIImageView+JZYICornerRadius.h"

@interface JZYIImageView ()

@property (nonatomic, weak) id<JZYIImageViewDelegate> delegate;

@end

@implementation JZYIImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+ (instancetype)setupImageViewWithFrame:(CGRect)frame
                                  image:(UIImage *)image
//                            borderWidth:(CGFloat)borderWidth
//                            borderColor:(UIColor *)borderColor
                           cornerRadius:(CGFloat)cornerRadius
{
    JZYIImageView *imageView     = [[JZYIImageView alloc] init];
    imageView.backgroundColor    = [UIColor clearColor];
    imageView.frame              = frame;
    imageView.image              = image;
//    imageView.layer.borderColor = borderColor.CGColor;
//    imageView.layer.borderWidth = borderWidth;
    imageView.contentMode        = UIViewContentModeScaleToFill;
    imageView.aliCornerRadius    = cornerRadius;
//    imageView.layer.cornerRadius = 50.f;
//    imageView.layer.masksToBounds = true;
    
    return imageView;
}


- (void)clickedImage
{
    if (_delegate && [_delegate respondsToSelector:@selector(clickedImageView:)]) {
        [_delegate clickedImageView:self];
    }
}

- (void)imageAddTap:(id<JZYIImageViewDelegate>)delegate
{
    _delegate = delegate;
    
    [self p_removeGesture];
    [self p_addGesture];
}

- (void)p_addGesture
{
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(clickedImage)];
    [self addGestureRecognizer:tap];
}

- (void)p_removeGesture
{
    self.userInteractionEnabled = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(clickedImage)];
    [self removeGestureRecognizer:tap];
}

@end
