//
//  JZYIStorageInfo.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "JZYIStorageInfo.h"

#import <CoreGraphics/CGBase.h>
#import <sys/mount.h>
#import <sys/sysctl.h>
#import <mach/mach.h>

@interface JZYIStorageInfo ()

//@property (nonatomic, strong) NSProcessInfo *processInfo;

@end

@implementation JZYIStorageInfo

//+ (instancetype)storageInfo {
//    static JZYIStorageInfo *info = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        info = [[self alloc] init];
//    });
//    return info;
//}

//可用磁盘容量
+ (NSString *)getDiskFreeSizeBySizeType:(JZYISizeType)type
{
    if (type == JZYISizeTypeOrigin) {
        return [NSString stringWithFormat:@"%lld",[self p_getDiskFreeSize]];
    }else {
        return [JZYIStorageInfo p_getSizeFromString:[self p_getDiskFreeSize]];
    }
    return nil;
}

//已用磁盘容量
+ (NSString *)getDiskUsedSizeBySizeType:(JZYISizeType)type
{
    if (type == JZYISizeTypeOrigin) {
        return [NSString stringWithFormat:@"%lld",[JZYIStorageInfo p_getDiskTotalSize]-[JZYIStorageInfo p_getDiskFreeSize]];
    }else {
        return [JZYIStorageInfo p_getSizeFromString:([JZYIStorageInfo p_getDiskTotalSize]-[JZYIStorageInfo p_getDiskFreeSize])];
    }
    
}

//总磁盘容量
+ (NSString *)getDiskTotalSizeBySizeType:(JZYISizeType)type
{
    if (type == JZYISizeTypeOrigin) {
        return [NSString stringWithFormat:@"%lld",[JZYIStorageInfo p_getDiskTotalSize]];
    }else {
        return [self p_getSizeFromString:[JZYIStorageInfo p_getDiskTotalSize]];
    }
}

+ (NSString *)getMemoryFreeSizeBySizeType:(JZYISizeType)type
{
    return nil;
}

+ (NSString *)getMemoryUsedSizeBySizeType:(JZYISizeType)type
{
    return nil;
}

//物理内存大小
+ (NSString *)getMemoryTotalSizeBySizeType:(JZYISizeType)type
{
    if (type == JZYISizeTypeOrigin) {
        return [NSString stringWithFormat:@"%llu",[NSProcessInfo processInfo].physicalMemory];
    }else {
        return [JZYIStorageInfo p_getSizeFromString:[NSProcessInfo processInfo].physicalMemory];
    }
    
}

#pragma mark - private method
//总磁盘大小
+ (long long)p_getDiskTotalSize
{
    struct statfs buf;
    unsigned long long totalSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        totalSpace = (unsigned long long)(buf.f_bsize * buf.f_blocks);
    }
    return totalSpace;
}

//总磁盘大小
+ (long long)p_getDiskUsedSize
{
    struct statfs buf;
    unsigned long long totalSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        totalSpace = (unsigned long long)(buf.f_bsize * buf.f_blocks);
    }
    return totalSpace;
}

//可用磁盘大小
+ (long long)p_getDiskFreeSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    return freeSpace;
}

/**
 *  得到规格化的存储大小
 *
 *  @param size 原始大小
 *
 *  @return 规格化存储大小
 */
+ (NSString *)p_getSizeFromString:(long long)size
{
    if (size>1024*1024*1024) {
        return [NSString stringWithFormat:@"%.1fGB",size/1024.f/1024.f/1024.f];   //大于1G转化成G单位字符串
    }
    if (size<1024*1024*1024 && size>1024*1024) {
        return [NSString stringWithFormat:@"%.1fMB",size/1024.f/1024.f];   //转成M单位
    }
    if (size>1024 && size<1024*1024) {
        return [NSString stringWithFormat:@"%.1fkB",size/1024.f]; //转成K单位
    }else {
        return [NSString stringWithFormat:@"%.1lldB",size];   //转成B单位
    }
    
}

//#pragma mark - Lazy Load
//- (NSProcessInfo *)processInfo {
//    if (!_processInfo) {
//        _processInfo = [NSProcessInfo processInfo];
//    }
//    return _processInfo;
//}

@end
