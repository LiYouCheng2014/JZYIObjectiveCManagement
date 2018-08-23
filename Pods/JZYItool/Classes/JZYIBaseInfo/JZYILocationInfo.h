//
//  JZYILocationInfo.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

typedef void(^ChangeLocationBlock) (CLPlacemark *location,NSString *desc);

@interface JZYILocationInfo : NSObject

/**
 *  单例构造
 *
 *  @return 返回单例
 */
+ (instancetype)currentLocation;

/**
 *  block回调
 */
@property (nonatomic,copy)ChangeLocationBlock blockLocation;

/**
 *  得到设备当前的位置,block回调里面已经包含了CLPlacemark里面包含了你需要的信息，需要自取
 *  详细可以参考CLPlacemark类属性
 *
 *  @return CLLocation
 */
- (void)getCurrentLocation:(ChangeLocationBlock)block;

@end
