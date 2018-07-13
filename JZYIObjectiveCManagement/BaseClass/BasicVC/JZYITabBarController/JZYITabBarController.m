//
//  JZYITabBarController.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/6.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYITabBarController.h"

#import "JZYIHomeVC.h"
#import "JZYIFindVC.h"
#import "JZYIAddressBook.h"
#import "JZYIMyVC.h"

@interface JZYITabBarController ()

@end

@implementation JZYITabBarController

#pragma mark - 1、生命周期函数 life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setTabBar];
    
    self.selectedIndex = 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 2、系统代理 system delegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    //    UINavigationController *nav = (UINavigationController *)tabBarController.selectedViewController;
//    UINavigationController *nav1 = (UINavigationController *)viewController;
//
//    if ([nav1.topViewController isKindOfClass:[JZYIMessageVC class]]) {
//        [JZYI_NOTIFACTION_CENTER postNotificationName:@"test" object:nil];
//        return false;
//    }
//    //
//    //    JZYILog(@"viewController= %@ = %d == %@",nav1.topViewController,tabBarController.selectedIndex,nav.topViewController);
//    ////    if (tabBarController.selectedIndex == 0||tabBarController.selectedIndex == 2) {
//    ////        return false;
//    ////    }
    return true;
}

#pragma mark - 3、自定义代理 custom delegete



#pragma mark - 4、相关响应事件 event response


#pragma mark - 5、自定义函数 private methods

- (void)p_setTabBar
{
    NSDictionary *selectedAttr = @{ NSForegroundColorAttributeName : [UIColor colorForSpecial],
                                    NSFontAttributeName : [UIFont fontFor20]
                                    };
    NSDictionary *normalAttr = @{ NSForegroundColorAttributeName : [UIColor colorForNormal],
                                  NSFontAttributeName : [UIFont fontFor20]
                                  };
    [[UITabBarItem appearance] setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor getColor:@"d5d5d5"]]];
    
    self.viewControllers = [self p_createVC];
    
//    self.delegate = self;
    //    [self setSelectedIndex:2];
}

- (NSArray *)p_createVC
{
    NSArray *vcArray =@[ [JZYIHomeVC new],
                         [JZYIFindVC new],
                         [JZYIAddressBook new],
                         [JZYIMyVC new]
                         ];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabbar" ofType:@"plist"]];
    
    NSMutableArray *vcMArray = [NSMutableArray array];
    for (NSInteger i = 0; i < array.count; i++) {
        NSDictionary *dict = array[i];
        
        if ([dict[@"show"] boolValue]) {
            UIViewController *vc = vcArray[i];
            JZYINavigationController *navVC = [[JZYINavigationController alloc] initWithRootViewController:vc];
            navVC.tabBarItem.title = dict[@"name"];//标题
            navVC.tabBarItem.selectedImage = [[UIImage imageNamed:dict[@"selectIcon"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//选择
            navVC.tabBarItem.image = [[UIImage imageNamed:dict[@"normIcon"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//未选择
//            if ([dict[@"name"] isEqualToString:@"消息"]) {
//                navVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"jzyi_icon_open_access"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//选择
//                navVC.tabBarItem.image = [[UIImage imageNamed:@"jzyi_icon_open_access"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//未选择
//
//            }
//            else {
//                navVC.tabBarItem.title = dict[@"name"];//标题
//                navVC.tabBarItem.selectedImage = [[UIImage imageNamed:dict[@"selectIcon"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//选择
//                navVC.tabBarItem.image = [[UIImage imageNamed:dict[@"normIcon"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//未选择
//            }
            
            [vcMArray addObject:navVC];
        }
    }
    
    return vcMArray;
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters

@end
