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
    [self createButton];
    [self createTextField];
    [self createTextView];
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
    JZYIImageView *imageView = [JZYIImageView setupImageViewWithFrame:CGRectZero image:[UIImage imageNamed:@"1"] cornerRadius:50.f];
    imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:imageView];
    
    //添加手势
    [imageView imageAddTap:self];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 100.f));
        make.top.mas_equalTo(200.f);
        make.left.mas_equalTo(50.f);
    }];
}

- (void)createButton
{
    JZYIButton *button = [JZYIButton setupButtonWithFrame:CGRectZero font:[UIFont systemFontOfSize:13] target:self action:@selector(clickedButton:) borderWidth:1 borderColor:[UIColor redColor] cornerRadius:15];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 100.f));
        make.top.mas_equalTo(200.f);
        make.right.mas_equalTo(-50.f);
    }];
}

- (void)createTextField {
    JZYITextField *textField = [JZYITextField setupTextFieldWithFrame:CGRectZero font:[UIFont systemFontOfSize:13] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter placeholder:@"请输入您尊贵的名字" text:nil];
//    textField.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:textField];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 80.f));
        make.top.mas_equalTo(320.f);
        make.left.mas_equalTo(50.f);
    }];
}

- (void)createTextView {
    JZYITextView *textView = [JZYITextView setupTextViewWithFrame:CGRectZero font:[UIFont systemFontOfSize:13] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter placeholder:@"请输入您尊贵的描述" text:nil];
//    textView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:textView];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 80.f));
        make.top.mas_equalTo(320.f);
        make.right.mas_equalTo(-50.f);
    }];
}

int (^addBlock)(int a,int b) = ^(int a, int b) {
    return a + b;
};

#pragma mark - JZYIImageViewDelegate

- (void)clickedButton:(JZYIButton *)btn {
    NSLog(@"点击按钮");
}

- (void)clickedImageView:(JZYIImageView *)imageView
{
    NSLog(@"点击图片");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
