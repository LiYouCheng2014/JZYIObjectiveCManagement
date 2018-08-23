//
//  JZYIAutoCycleScrollProtocol.h
//  JZYIAutoCycleScroll
//
//  Created by liyoucheng on 2018/6/7.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol JZYIAutoCycleScrollProtocol <NSObject>

@required

/**
 cell的服用

 @param collectionView collectionView description
 @param indexPath indexPath description
 @param object object description
 @return return value description
 */
- (UICollectionViewCell *)jzyi_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath object:(id)object;

@optional

/**
 滚动到第几页

 @param page 页码
 */
- (void)jzyi_showViewWithPage:(NSInteger)page;

/**
 点击第几页

 @param obj 第几页的对象
 @param page 页码
 */
- (void)jzyi_didSelectWitObj:(id)obj page:(NSInteger)page;

@end
