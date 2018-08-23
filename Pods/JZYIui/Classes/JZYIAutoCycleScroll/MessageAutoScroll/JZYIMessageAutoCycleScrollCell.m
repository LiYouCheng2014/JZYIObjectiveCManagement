//
//  JZYIViewAutoCycleScrollCell.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/17.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIMessageAutoCycleScrollCell.h"

#import <JZYItool/JZYICommon.h>

@interface JZYIMessageAutoCycleScrollCell ()

@property (nonatomic, strong) JZYILabel *typeLabel; //!< 类型
@property (nonatomic, strong) JZYILabel *contentLabel; //!< 内容

@end

@implementation JZYIMessageAutoCycleScrollCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.typeLabel];
        [self addSubview:self.contentLabel];
        
        [self p_setupConstraints];
    }
    return self;
}

#pragma mark - 1、生命周期函数 life cycle

#pragma mark - 2、系统代理 system delegate

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - 4、相关响应事件 event response

#pragma mark - 5、自定义函数 private methods

- (void)p_setupConstraints
{
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10.f);
        make.top.equalTo(self).offset(10.f);
        make.bottom.equalTo(self).offset(-10.f);
        make.width.equalTo(@70.f);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLabel.mas_right).offset(10.f);
        make.top.equalTo(self.typeLabel.mas_top);
        make.bottom.equalTo(self.typeLabel.mas_bottom);
        make.right.equalTo(self.mas_right).offset(-10.f);
    }];
}

- (void)refreshUIWithType:(NSString *)type
              withContent:(NSString *)content {
    _typeLabel.text = type;
    _contentLabel.text = content;
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters

- (JZYILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [JZYILabel setupLabelWithFrame:CGRectZero font:[UIFont fontFor28] textColor:[UIColor getColor:@"404040"] textAlignment:NSTextAlignmentLeft numberOfLines:0 text:nil];
    }
    return _typeLabel;
}

- (JZYILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [JZYILabel setupLabelWithFrame:CGRectZero font:[UIFont fontFor28] textColor:[UIColor getColor:@"404040"] textAlignment:NSTextAlignmentLeft numberOfLines:0 text:nil];
    }
    return _contentLabel;
}

@end
