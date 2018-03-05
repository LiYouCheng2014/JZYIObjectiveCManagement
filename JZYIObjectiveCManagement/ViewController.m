//
//  ViewController.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/2/28.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "ViewController.h"

#import "JZYIBasicUI.h"

#import <Masonry.h>

#import "Person.h"

static const NSTimeInterval kAnimationDuration = 0.3;

NSString *const EOCStringConstant = @"VALUES";


@interface ViewController ()
<JZYIImageViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createView];
    [self createLabel];
    [self createImageView];
}

- (void)createView
{
    JZYIView *view = [JZYIView setupViewWithFrame:CGRectZero backgroundColr:[UIColor greenColor] borderWidth:1 borderColor:[UIColor redColor] cornerRadius:10.f];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 100.f));
        make.left.mas_equalTo(50.f);
        make.top.mas_equalTo(50.f);
    }];
}

- (void)createLabel
{
    JZYILabel *label = [JZYILabel setupLabelWithFrame:CGRectZero font:[UIFont systemFontOfSize:14] textColor:[UIColor redColor] textAlignment:NSTextAlignmentCenter numberOfLines:0 text:@"齐家科技123456Student"];
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    //设置圆角
    label.radius = 15.f;
    
    //刷新带行距文本
    [label refreshUIWithSpace];
    //获取带行距高度
    CGFloat height = [label getSpaceHeightOfWidth:100.f];
    NSLog(@"height = %f",height);
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 100.f));
        make.top.mas_equalTo(50.f);
        make.right.mas_equalTo(-50.f);
    }];
}

- (void)createImageView
{
    JZYIImageView *imageView = [JZYIImageView setupImageViewWithFrame:CGRectZero image:[UIImage imageNamed:@"1"]];
    imageView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:imageView];
    
    //添加手势
    [imageView imageAddTap:self];
    //设置圆角
    imageView.aliCornerRadius = 50.f;
    
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 100.f));
        make.top.mas_equalTo(200.f);
        make.left.mas_equalTo(50.f);
    }];
}

#pragma mark - JZYIImageViewDelegate

- (void)clickedImageView:(JZYIImageView *)imageView
{
    NSLog(@"点击图片");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
