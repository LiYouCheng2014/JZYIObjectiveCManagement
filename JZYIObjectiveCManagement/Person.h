//
//  Person.h
//  JZYIObjectiveCManagement
//
//  Created by GigaLiyoucheng on 2018/3/1.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
@protocol PersonDelegate <NSObject>

@optional
- (void)networkFetcher:(Person *)person error:(NSError *)error;

@end

@interface Person : NSObject

@property (nonatomic, copy, readonly) NSString *firstName ;  //!< <#注释#>
@property (nonatomic, copy, readonly) NSString *lastName ;  //!< <#注释#>

@property (nonatomic, weak) id<PersonDelegate> delegate ;  //!< <#注释#>

//全能初始化方法
- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName;

@end
