//
//  JZYIProjectInfo.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  获取当前项目信息
 */
@interface JZYIProjectInfo : NSObject

/**
 *  得到当前工程的实例
 *
 *  @return 单例实例
 */
//+ (instancetype)currentProject;

/**
 *  得到当前项目版本
 *
 *  @return 当前版本
 */
+ (NSString *)getProjectVersion;

/**
 *  得到当前项目构建版本号
 *
 *  @return 当前构建版本
 */
+ (NSString *)getProjectBuildVersion;

/**
 *  得到当前项目名称
 *
 *  @return 当前名称
 */
+ (NSString *)getProjectName;

@end
