//
//  Person.m
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/1.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "Person.h"

@interface Person ()
<NSCopying>
{
    struct {
        unsigned int didReceiveData : 1;
    } _delegateFlags;
}
// class-continuation
@property (nonatomic, copy, readwrite) NSString *firstName ;  //!< <#注释#>
@end

@implementation Person

//全能初始化方法
- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName {
    if (self = [super init]) {
        _firstName = [firstName copy];
        _lastName = [lastName copy];
    }
    return self;
}

- (void)setDelegate:(id<PersonDelegate>)delegate {
    _delegate = delegate;
    _delegateFlags.didReceiveData = [delegate respondsToSelector:@selector(networkFetcher:error:)];
}

- (id)copyWithZone:(NSZone *)zone {
    Person *copy = [[[self class] allocWithZone:zone] initWithFirstName:_firstName lastName:_lastName];
    return copy;
}



//私有方法加前缀
- (void)p_test
{
//    if (_delegate && [_delegate respondsToSelector:@selector(networkFetcher:error:)]) {
//        [_delegate networkFetcher:self error:nil];
//    }
    //优化响应,通过位段
    if (_delegateFlags.didReceiveData) {
        [_delegate networkFetcher:self error:nil];
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@>",@{
                                                @"firstName": _firstName,
                                                @"lastName": _lastName
                                                
                                                }];
}

//通过po命令获取获取
- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"<%@: %p, \"%@\">",[self class],self,@{
                                                                              @"firstName": _firstName,
                                                                              @"lastName": _lastName
                                                                              }];
}
@end
