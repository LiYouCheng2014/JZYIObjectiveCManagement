//
//  UIImage+JZYITool.m
//  JZYItool
//
//  Created by kaisa-ios-001 on 2018/8/6.
//  Copyright © 2018年 齐家科技. All rights reserved.
//

#import "UIImage+JZYITool.h"

@implementation UIImage (JZYITool)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    return [UIImage imageWithColor:color frame:rect];
}

+ (UIImage *)imageWithColor:(UIColor *)color
                      frame:(CGRect)frame
{
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, frame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (NSString *)imageWriteFileName:(NSString *)fileName
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    cachePath = [cachePath stringByAppendingPathComponent:fileName];
    NSData *data = UIImageJPEGRepresentation(self, 0.8);
    [data writeToFile:cachePath atomically:YES];
    
    return cachePath;
}

@end
