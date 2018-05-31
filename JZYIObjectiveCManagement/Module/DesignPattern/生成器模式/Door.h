//
//  Door.h
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/5/30.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "BuilderProtocol.h"
#import "AbstractDoor.h"

@interface Door : NSObject<AbstractDoor,BuilderProtocol>

@end
