//
//  ShapeMaker.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/7.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "ShapeMaker.h"

#import "Circle.h"
#import "Rectangle.h"

@implementation ShapeMaker

+ (void)drawCicleWithParas:(NSDictionary *)paras
{
    Circle *circle = [Circle new];
    circle.radius = 10.f;
    [circle draw];
}

+ (void)drawCicleAdnRectangle:(NSDictionary *)paras
{
    //圆
    Circle *circle = [Circle new];
    circle.radius = 10.f;
    [circle draw];
    
    //矩形
    Rectangle *rectangele = [Rectangle new];
    rectangele.width = 10.f;
    rectangele.height = 20.f;
    [rectangele draw];
}

@end
