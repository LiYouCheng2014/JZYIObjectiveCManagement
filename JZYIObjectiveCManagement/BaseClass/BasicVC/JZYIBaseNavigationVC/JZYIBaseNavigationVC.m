//
//  JZYIBaseNavigationVC.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIBaseNavigationVC.h"

static NSString *kLeftArrowImageName = @"jzyi_icon_left_arrow_gray";

@interface JZYIBaseNavigationVC ()

@end

@implementation JZYIBaseNavigationVC

#pragma mark - 1、生命周期函数 life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self p_setupPopGesture];
}

- (void)dealloc {
//    JZYILog(@"释放类==>:%@",NSStringFromClass([self class]));
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self p_setupInit];
    
//    JZYILog(@"出现类==>:%@",NSStringFromClass([self class]));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    JZYILog(@"消失类==>:%@",NSStringFromClass([self class]));
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 2、系统代理 system delegate

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - 4、相关响应事件 event response

- (void)clickedNavLeft
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickedNavRight
{
    
}

#pragma mark - 5、自定义函数 private methods

- (void)p_setupInit
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self p_setupNavigationAttributed];
    [self p_setupTitleAttributed];
    [self setupLeftButtonTitle:nil textColor:nil image:[UIImage imageNamed:kLeftArrowImageName]];
}

//启动系统手势返回
- (void)p_setupPopGesture
{
    JZYI_WEAK_SELF(self);
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)weakself;
    }
}

//设置导航条属性
- (void)p_setupNavigationAttributed
{
    //设置状态栏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTranslucent:false];
    
    CGRect frame = CGRectMake(0, 0, JZYI_SCREEN_WIDTH, JZYI_TOP_HEIGHT);
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] frame:frame] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor colorForLine]]];
}

//设置标题属性
- (void)p_setupTitleAttributed
{
    NSDictionary *titleDict = @{
                                NSFontAttributeName : [UIFont fontFor36],
                                NSForegroundColorAttributeName : [UIColor blackColor]
                                };
    [self.navigationController.navigationBar setTitleTextAttributes:titleDict];
}

- (void)setupLeftButtonTitle:(NSString *)title
{
    [self setupLeftButtonTitle:title textColor:[UIColor blackColor] image:nil];
}

- (void)setupLeftButtonTitle:(NSString *)title textColor:(UIColor *)color
{
    [self setupLeftButtonTitle:title textColor:color image:nil];
}

- (void)setupLeftButtonTitle:(NSString *)title textColor:(UIColor *)textColor image:(UIImage *)image
{
    UIBarButtonItem *leftItem = [self p_setupButtonFrame:CGRectMake(0, 0, 44, 44) title:title textColor:textColor image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] action:@selector(clickedNavLeft)];

    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -0;
    
    if (leftItem) {
        self.navigationItem.leftBarButtonItems = @[ leftItem,negativeSeperator ];
    }
    else {
        self.navigationItem.leftBarButtonItem = negativeSeperator;
    }
}

- (void)setupRightButtonTitle:(NSString *)title
{
    [self setupRightButtonTitle:title textColor:[UIColor blackColor] image:nil];
}

- (void)setupRightButtonTitle:(NSString *)title textColor:(UIColor *)color
{
    [self setupRightButtonTitle:title textColor:color image:nil];
}

- (void)setupRightButtonImage:(UIImage *)image
{
    [self setupRightButtonTitle:nil textColor:nil image:image];
}

- (void)setupRightButtonTitle:(NSString *)title textColor:(UIColor *)textColor image:(UIImage *)image
{
    UIBarButtonItem *rightItem = [self p_setupButtonFrame:CGRectMake(0, 0, 70, 44) title:title textColor:textColor image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] action:@selector(clickedNavRight)];
    
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -0;
    
    if (rightItem) {
        self.navigationItem.rightBarButtonItems = @[negativeSeperator,rightItem];
    }
    else {
        self.navigationItem.rightBarButtonItem = negativeSeperator;
    }
}

- (UIBarButtonItem *)p_setupButtonFrame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)textColor image:(UIImage *)image action:(SEL)sel
{
    JZYIButton *button = [JZYIButton setupButtonWithFrame:frame font:[UIFont fontForSubTitle] target:self action:sel borderWidth:0 borderColor:nil cornerRadius:0];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

- (void)backToVC:(UIViewController *)vc
{
    NSArray *array = self.navigationController.viewControllers;
    
    __block UIViewController *toVC = nil;
    [array enumerateObjectsUsingBlock:^(UIViewController *tempVC, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([tempVC isKindOfClass:[vc class]]) {
            toVC = tempVC;
        }
    }];

    if (toVC) {
        [self.navigationController popToViewController:toVC animated:YES];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)backToIndex:(NSInteger)index
{
    NSArray *array = self.navigationController.viewControllers;
    if (index >= 0 && index < array.count) {
        [self.navigationController popToViewController:array[array.count - 1 - index] animated:YES];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setupNavTitle:(NSString *)title
{
    self.navigationItem.title = title;
}

- (void)setupLeftViewClear
{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItems = nil;
}

- (void)setupRightViewClear
{
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItems = nil;
}

- (void)setupTitleViewClear
{
    self.navigationItem.titleView = nil;
}

- (void)hideNavBottomLine
{
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)setupLeftView:(UIView *)view {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setupRightView:(UIView *)view {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setupTitleView:(UIView *)view {
    self.navigationItem.titleView = view;
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters

@end
