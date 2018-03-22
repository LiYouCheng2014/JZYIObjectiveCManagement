//
//  JZYIBusinessCardView.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIBusinessCardView.h"

#define BUSINESS_FRAME CGRectMake(0, 0, 200.f, 150.f)

@interface JZYIBusinessCardView ()

@property (nonatomic, strong) JZYILabel *nameLabel;
@property (nonatomic, strong) JZYIView *lineView;
@property (nonatomic, strong) JZYILabel *phoneNumberLabel;

@end

@implementation JZYIBusinessCardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:BUSINESS_FRAME];
    if (self) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.lineView];
        [self addSubview:self.phoneNumberLabel];
        
        [self p_setup];
        [self p_setupConstraints];
    }
    return self;
}

- (void)p_setup
{
    self.backgroundColor         = [UIColor greenColor];
    self.layer.borderWidth       = 0.5f;
    self.layer.shadowOpacity     = 0.5f;
    self.layer.shadowOffset      = CGSizeMake(5, 5);
    self.layer.shadowRadius      = 1.f;
    self.layer.shadowColor       = [UIColor grayColor].CGColor;
}

- (void)p_setupConstraints
{
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 25));
        make.left.equalTo(@15.f);
        make.top.equalTo(@10.f);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10.f);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@5.f);
    }];
    
    [self.phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20.f);
        make.left.equalTo(self.mas_left).offset(40.f);
        make.right.equalTo(self.mas_right).offset(-40.f);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (void)loadData:(id <JZYIBusinessCardAdapterProtocol>)data
{
    self.name        = [data name];
    self.lineColor   = [data lineColor];
    self.phoneNumber = [data phoneNumber];
}

#pragma mark - 重写setter，getter方法
@synthesize name        = _name;
@synthesize lineColor   = _lineColor;
@synthesize phoneNumber = _phoneNumber;

- (void)setName:(NSString *)name {
    _name           = name;
    _nameLabel.text = name;
}

- (NSString *)name {
    return _name;
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor                   = lineColor;
    _lineView.backgroundColor    = _lineColor;
}

- (UIColor *)lineColor {
    return _lineColor;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber             = phoneNumber;
    _phoneNumberLabel.text   = phoneNumber;
}

- (NSString *)phoneNumber {
    return _phoneNumber;
}


- (JZYILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [JZYILabel setupLabelWithFrame:CGRectZero font:[UIFont boldFontFor40] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:nil];
    }
    return _nameLabel;
}

- (JZYIView *)lineView {
    if (!_lineView) {
        _lineView = [JZYIView setupViewWithFrame:CGRectZero backgroundColr:[UIColor whiteColor] borderWidth:0 borderColor:nil cornerRadius:0];
    }
    return _lineView;
}

- (JZYILabel *)phoneNumberLabel {
    if (!_phoneNumberLabel) {
        _phoneNumberLabel = [JZYILabel setupLabelWithFrame:CGRectZero font:[UIFont fontFor32] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentRight numberOfLines:1 text:nil];
    }
    return _phoneNumberLabel;
}

@end
