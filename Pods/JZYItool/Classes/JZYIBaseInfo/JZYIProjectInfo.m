//
//  JZYIProjectInfo.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIProjectInfo.h"

@interface JZYIProjectInfo ()

//@property (nonatomic,strong)NSDictionary *projectInfoDic;

@end

@implementation JZYIProjectInfo

//+ (instancetype)currentProject {
//    static JZYIProjectInfo *projInfo = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        projInfo = [[self alloc] init];
//    });
//    return projInfo;
//}

+ (NSString *)getProjectName
{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
}

+ (NSString *)getProjectBuildVersion
{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"];
}

+ (NSString *)getProjectVersion
{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
}

//#pragma mark - Lazy load
//- (NSDictionary *)projectInfoDic {
//    if (!_projectInfoDic) {
//        _projectInfoDic = [[NSBundle mainBundle] infoDictionary];
//    }
//    return _projectInfoDic;
//}

@end
