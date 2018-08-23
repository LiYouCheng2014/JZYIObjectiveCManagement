//
//  JZYILoadingManagement.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/10.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYILoadingManagement.h"

#import <MBProgressHUD/MBProgressHUD.h>
#import "JZYIRefreshConfig.h"


@implementation JZYILoadingManagement

+ (void)showLoadingView:(UIView *)view
{
    
    NSArray *loadArray = nil;
    if ([JZYIRefreshConfig sharedInstance].loadArray) {
        loadArray = [JZYIRefreshConfig sharedInstance].loadArray;
    }
    else {
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 80; i++) {
            [mArray addObject:[JZYILoadingManagement jzyi_imageNamed:[NSString stringWithFormat:@"zhongjian00%02ld",(long)i + 1]]];
        }
        loadArray = [mArray copy];
    }
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.color = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
    UIImageView *gifImageView = [[UIImageView alloc] initWithImage:[loadArray firstObject]];
    [gifImageView setAnimationImages:loadArray];
    [gifImageView setAnimationDuration:1.5];
    [gifImageView setAnimationRepeatCount:0];
    [gifImageView startAnimating];
    
    hud.customView = gifImageView;
//    hud.customView.backgroundColor = [UIColor greenColor];
    [view addSubview:hud];
    [hud showAnimated:YES];
}

//读取NSBundle中图片
+ (UIImage *)jzyi_imageNamed:(NSString *)name
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    //    return [UIImage imageNamed:name];
}


+ (void)hideLoadingView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
