//
//  JZYIRefreshConfig.h
//  JZYILoading
//
//  Created by liyoucheng on 2018/4/8.
//

#import <Foundation/Foundation.h>

@interface JZYIRefreshConfig : NSObject

+ (instancetype)sharedInstance;

//刷新配置
@property (nonatomic, strong) NSArray *refreshFirstArray; //!< 前部分
@property (nonatomic, strong) NSArray *refreshLastArray; //!< 后部分

//加载配置
@property (nonatomic, strong) NSArray *loadArray; //!< 

@end
