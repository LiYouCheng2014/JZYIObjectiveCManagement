//
//  JZYIStorageInfo.h
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,JZYISizeType) {
    JZYISizeTypeOrigin = 2,   //原始数据，b
    JZYISizeTypeNormalized  //规格化后的数据
};

@interface JZYIStorageInfo : NSObject

/**
 *  单例构造
 *
 *  @return 当前类实例
 */
//+ (instancetype)storageInfo;

/**
 *  得到当前磁盘总大小
 *
 *  @param type 大小类型：JZYISizeTypeOrigin是原始大小，没有经过转换，单位为B；JZYISizeTypeNormalized是规格化后的大小
 *
 *  @return 返回大小，可能有差距，但是相差不大
 */
+ (NSString *)getDiskTotalSizeBySizeType:(JZYISizeType)type;

/**
 *  得到当前磁盘空闲内存大小
 *
 *  @param type type 大小类型：JZYISizeTypeOrigin是原始大小，没有经过转换，单位为B；JZYISizeTypeNormalized是规格化后的
 *
 *  @return 返回大小，可能有差距，但是相差不大
 */
+ (NSString *)getDiskFreeSizeBySizeType:(JZYISizeType)type;

/**
 *  得到当前磁盘已经使用的大小
 *
 *  @param type type 大小类型：JZYISizeTypeOrigin是原始大小，没有经过转换，单位为B；JZYISizeTypeNormalized是规格化后的
 *
 *  @return 返回大小，可能有差距，但是相差不大
 */
+ (NSString *)getDiskUsedSizeBySizeType:(JZYISizeType)type;

/**
 *  得到当前物理内存总大小，指通过物理内存而获得的内存空间大小
 *
 *  @param type 大小类型：JZYISizeTypeOrigin是原始大小，没有经过转换，单位为B；JZYISizeTypeNormalized是规格化后的大小
 *
 *  @return 返回大小
 */
+ (NSString *)getMemoryTotalSizeBySizeType:(JZYISizeType)type;

/**
 *  得到当前物理内存空闲内存大小 Unimplemented
 *
 *  @param type type 大小类型：JZYISizeTypeOrigin是原始大小，没有经过转换，单位为B；JZYISizeTypeNormalized是规格化后的
 *
 *  @return 返回大小，可能有差距，但是相差不大
 */
+ (NSString *)getMemoryFreeSizeBySizeType:(JZYISizeType)type;

/**
 *  得到当前内存已经使用的大小 Unimplemented
 *
 *  @param type type 大小类型：JZYISizeTypeOrigin是原始大小，没有经过转换，单位为B；JZYISizeTypeNormalized是规格化后的
 *
 *  @return 返回大小，可能有差距，但是相差不大
 */
+ (NSString *)getMemoryUsedSizeBySizeType:(JZYISizeType)type;

@end
