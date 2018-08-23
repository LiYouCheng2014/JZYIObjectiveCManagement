//
//  JZYIImageAutoCycleScrollCell.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/17.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIImageAutoCycleScrollCell.h"

#import <JZYItool/JZYICommon.h>

@interface JZYIImageAutoCycleScrollCell ()

@property (nonatomic, strong) JZYIImageView *logoImageView; //!<

@end

@implementation JZYIImageAutoCycleScrollCell

#pragma mark - 1、生命周期函数 life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.logoImageView];
        
        [self p_setupConstraints];
    }
    return self;
}

#pragma mark - 2、系统代理 system delegate

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - 4、相关响应事件 event response

#pragma mark - 5、自定义函数 private methods

- (void)refreshUIWithTarget:(id)target placeholderImage:(UIImage *)placeholderImage
{
    if ([target isKindOfClass:[NSString class]]) {
        
        [self.logoImageView jzyi_setImageWithString:target placeholderImage:placeholderImage];
    }
    else if ([target isKindOfClass:[UIImage class]]) {
        self.logoImageView.image = (UIImage *)target;
    }
}

- (void)p_setupConstraints
{
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
    }];
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters

- (JZYIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [JZYIImageView setupImageViewWithFrame:CGRectZero image:nil cornerRadius:0];
    }
    return _logoImageView;
}

@end
