//
//  JZYIBusinessCardAdapter.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/3/22.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "JZYIBusinessCardAdapterProtocol.h"

@interface JZYIBusinessCardAdapter : NSObject<JZYIBusinessCardAdapterProtocol>


/**
 输入对象
 */
@property (nonatomic, weak) id data;

/**
 与输入对象建立联系

 @param data 对象
 @return 对象
 */
- (instancetype)initWithData:(id)data;

@end
