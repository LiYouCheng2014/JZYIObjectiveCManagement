//
//  PhoneProtocol.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/16.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PhoneProtocol <NSObject>

@required
- (void)phoneCall;
- (void)sendMessage;

@end
