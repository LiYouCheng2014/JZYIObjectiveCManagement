//
//  JZYIPageControl.h
//  JZYICommonUI
//
//  Created by liyoucheng on 2018/5/28.
//

#import <UIKit/UIKit.h>

//!< 滚动方向
typedef NS_ENUM(NSInteger, JZYIPageControlAlignment) {
    JZYIPageControlAlignmentLeft = 0, //!< 左边
    JZYIPageControlAlignmentCenter = 1, //!< 中间
    JZYIPageControlAlignmentRight = 2,//右边
};

@interface JZYIPageControl : UIPageControl

+ (instancetype)setupPageControlWithFrame:(CGRect)frame dotSize:(CGSize)dotSize dotSpace:(CGFloat)dotSpace alignment:(JZYIPageControlAlignment)alignment;

@end

