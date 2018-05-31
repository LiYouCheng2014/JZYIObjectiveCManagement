//
//  Receiver.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/31.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "Receiver.h"

@implementation Receiver

- (void)setClientView:(UIView *)clientView {
    _clientView = clientView;
    UIColor *color = _clientView.backgroundColor;
    
    [color getHue:&_hud saturation:&_saturation brightness:&_brightness alpha:&_alpha];
}

//变暗
- (void)makeDarker:(CGFloat)parameter
{
    _brightness -= parameter;
    _brightness = MAX(0, _brightness);
    
    _clientView.backgroundColor = [UIColor colorWithHue:_hud saturation:_saturation brightness:_brightness alpha:_alpha];
}

//变亮
- (void)makeLighter:(CGFloat)parameter
{
    _brightness += parameter;
    _brightness = MIN(1, _brightness);
    
    _clientView.backgroundColor = [UIColor colorWithHue:_hud saturation:_saturation brightness:_brightness alpha:_alpha];
}

////增加频道
//- (void)addNum:(NSNumber *)num
//{
//    // to do
//}
//
////减少频道
//- (void)deleteNum:(NSNumber *)num
//{
//    //to do
//}

@end
