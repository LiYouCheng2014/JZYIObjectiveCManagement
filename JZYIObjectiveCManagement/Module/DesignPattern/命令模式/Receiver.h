//
//  Receiver.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface Receiver : NSObject {
    CGFloat _hud;
    CGFloat _saturation;
    CGFloat _brightness;
    CGFloat _alpha;
}

//@property (nonatomic, strong) id client; //!< 被服务对象

////增加频道
//- (void)addNum:(NSNumber *)num;
//
////减少频道
//- (void)deleteNum:(NSNumber *)num;

//一般添加到视图上去了，所以用weak
@property (nonatomic, weak) UIView *clientView; //!< 被服务对象

//变暗
- (void)makeDarker:(CGFloat)parameter;

//变亮
- (void)makeLighter:(CGFloat)parameter;

@end
