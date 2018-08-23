//
//  JZYIRefreshConfig.m
//  JZYILoading
//
//  Created by liyoucheng on 2018/4/8.
//

#import "JZYIRefreshConfig.h"

@implementation JZYIRefreshConfig

+ (instancetype)sharedInstance {
    static JZYIRefreshConfig *config = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[[self class] alloc] init];
    });
    return config;
}

@end
