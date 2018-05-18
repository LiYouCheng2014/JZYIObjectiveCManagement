//
//  AbstractProxy.m
//  JZYIObjectiveCManagement
//
//  Created by liyoucheng on 2018/5/18.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "AbstractProxy.h"

#import "AbstractExcute.h"

#import <objc/runtime.h>

@implementation AbstractProxy

//派发信息
- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL selector = [invocation selector];
    if ([self.delegate respondsToSelector:selector]) {
        [invocation setTarget:self.delegate];
        [invocation invoke];
    }
    else {
        NSString *selectorString = NSStringFromSelector(invocation.selector);
        
        invocation.selector = NSSelectorFromString(@"nullExcute:");
        AbstractExcute *excute = [AbstractExcute shareInstance];
        [invocation setTarget:excute];
        
        const char *className = class_getName([self class]);
        NSArray *infos = nil;
        if (self.delegate) {
            infos = @[ [NSString stringWithUTF8String:className],selectorString,@""];
        }
        else {
            infos = @[ [NSString stringWithUTF8String:className],selectorString];
        }
        
        [invocation setArgument:&infos atIndex:2];//写死的2
        
        [invocation invoke];
    }
}

//验证方法签名
- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    if ([self.delegate respondsToSelector:sel]) {
        return [self.delegate methodSignatureForSelector:sel];
    }
    else {
        AbstractExcute *excute = [AbstractExcute shareInstance];
        return [excute methodSignatureForSelector:NSSelectorFromString(@"nullExcute:")];
    }
}

@end
