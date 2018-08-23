//
//  JZYIMoreImageSelectView.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/18.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYIMoreImageSelectView.h"

//选择图片
#import "JZYISelectImageView.h"
//查看图片
#import "JZYILookImageView.h"
//#import "JZYIUtilsMacros.h"


@interface JZYIMoreImageSelectView ()
<JZYIImageViewDelegate,
JZYISelectImageViewDelegate,
JZYILookImageViewDelegate>

@property (nonatomic, strong) NSMutableArray *imageMArray;//保存所有图片按钮
@property (nonatomic, strong) JZYISelectImageView *selectImageView;//选择图片
@property (nonatomic, strong) JZYILookImageView *lookImageCustomView;//预览图片

@property (nonatomic, assign) NSInteger currentSelectIndex;//当前点击的位置
@property (nonatomic, assign) BOOL isLastSelect;//最后一张是否选择图片

@end

@implementation JZYIMoreImageSelectView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.edges = UIEdgeInsetsMake(15, 15, 15, 15);
        self.rowSpace = 5;
        self.columnSpace = 5;
        self.imageSize = CGSizeMake(44, 44);
        self.currentSelectIndex = 0;
        self.maxImageCount = 6;
        self.isLastSelect = NO;
        
        //        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

//即日起（2017年3月8日)，请按照此顺序书写代码，以便统一
#pragma mark - 1、生命周期函数 life cycle

#pragma mark - 2、系统代理 system delegate

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - JZYINewAddImageViewDelegate

- (void)addSelectImageArray:(NSArray *)array
{
//    JZYILog(@"count = %d",self.imageMArray.count);
    [self refreshUIWithArray:array];
}

- (void)addImage:(UIImage *)image
{
    if (self.imageMArray.count < self.maxImageCount) {
        //不超过限制，增加添加按钮
        [self addSubview:[self addImageView]];
        self.isLastSelect = NO;
    }
    
    if (self.currentSelectIndex < self.imageMArray.count) {
        JZYIImageView *imageView = self.imageMArray[self.currentSelectIndex];
        imageView.image = image;
        
        if (self.currentSelectIndex == self.maxImageCount - 1) {
            //最后一张选择了图片
            self.isLastSelect = YES;
        }
    }
    
    [self resultChange];
}

#pragma mark - JZYIImageViewDelegate

- (void)clickedImageView:(JZYIImageView *)imageView
{
    self.currentSelectIndex = [self getClickIndex:imageView];
    
    if (self.currentSelectIndex == self.imageMArray.count - 1) {
        //添加图片
        if (self.isLastSelect) {
            //最后一个按钮已经选择图片
            NSMutableArray *mArray = [NSMutableArray arrayWithArray:self.imageMArray];
            [self.lookImageCustomView showView];
            [self.lookImageCustomView refreshUIWithArray:mArray withIndex:self.currentSelectIndex];
        }
        else {
            [self.selectImageView showView:self];
        }
    }
    else {
        //预览图片
        NSMutableArray *mArray = [NSMutableArray arrayWithArray:self.imageMArray];
        if (!self.isLastSelect) {
            [mArray removeLastObject];
        }
        [self.lookImageCustomView showView];
        [self.lookImageCustomView refreshUIWithArray:mArray withIndex:self.currentSelectIndex];
    }
    
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

#pragma mark - JZYILookImageViewDelegate

//删除图片
- (void)deleteImageWithIndex:(NSInteger)index
{
    if (index < self.imageMArray.count) {
        //删除index位置图片
        JZYIImageView *imageView = self.imageMArray[index];
        [imageView removeFromSuperview];
        imageView = nil;
        
        [self.imageMArray removeObjectAtIndex:index];
        
        if (self.imageMArray.count < 1) {
            //已经无需要显示图片
            [self.lookImageCustomView removeFromSuperview];
        }
        else {
            //位置全部重新刷新,优化点 只刷新后续部分，不会很多，故不做刷新
            for (NSInteger i = 0; i < self.imageMArray.count; i++) {
                CGPoint point;
                JZYIImageView *curImageView = self.imageMArray[i];
                if (i == 0) {
                    point = [self getNextImageViewPoint:nil];
                }
                else {
                    JZYIImageView *pImageView = self.imageMArray[i - 1];
                    point = [self getNextImageViewPoint:pImageView];
                }
                curImageView.left = point.x;
                curImageView.top = point.y;
            }
            
            if (self.isLastSelect) {
                //最后一张选择了图片,删除了一张图，需要重新把加号添加回来
                [self addSubview:[self addImageView]];
                self.isLastSelect = NO;
            }
            
            NSMutableArray *mArray = [NSMutableArray arrayWithArray:self.imageMArray];
            [mArray removeLastObject];
            
            self.currentSelectIndex = (index < mArray.count ? index : mArray.count - 1);
            //预览图片
            if (self.currentSelectIndex < 0) {
                [self.lookImageCustomView removeFromSuperview];
            }
            else {
                [self.lookImageCustomView refreshUIWithArray:mArray
                                                   withIndex:self.currentSelectIndex];
            }
            
        }
        
        [self getSelfHeight];
        
        [self resultChange];
    }
}

#pragma mark - 4、相关响应事件 event response


#pragma mark - 5、自定义函数 private methods

//获取当前点击的index
- (NSInteger)getClickIndex:(JZYIImageView *)imageView
{
    NSInteger index = 0;
    for (JZYIImageView *iv in self.imageMArray) {
        if ([iv isEqual:imageView]) {
            //获取当前点击的位置
            break;
        }
        index += 1;
    }
    
    return index;
}

//获取下一个图片的x,y
- (CGPoint)getNextImageViewPoint:(JZYIImageView *)imageView
{
    CGFloat x = 0.0;
    CGFloat y = 0.0;
    if (imageView) {
        if (imageView.right + self.columnSpace + self.imageSize.width + self.edges.right < self.width) {
            //未超出最右边
            x = imageView.right + self.columnSpace;
            y = imageView.top;
        }
        else {
            x = self.edges.left;
            y = imageView.bottom + self.rowSpace;
        }
    }
    else {
        x = self.edges.left;
        y = self.edges.top;
    }
    
    return CGPointMake(x, y);
}

//获取添加图片位置信息
- (CGRect)getAddImageViewFrame
{
    //获取添加图片按钮位置
    NSArray *array = self.imageMArray;
    
    JZYIImageView *lastImageView = [array lastObject];
    CGPoint point = [self getNextImageViewPoint:lastImageView];
    
    return CGRectMake(point.x, point.y, self.imageSize.width, self.imageSize.height);
}

//获取self的高度
- (void)getSelfHeight
{
    UIImageView *lastImageView = [self.imageMArray lastObject];
    CGFloat totalHeight = lastImageView.bottom + self.edges.bottom;
    if (self.heightBlock) {
        self.heightBlock(totalHeight);
    }
}

////多张图片显示
//- (void)refreshUIWithArray:(NSArray *)array first:(NSInteger)first
//{
//    if (array > 0) {
//        if (array.count + self.imageMArray.count - 1 - 1< self.maxImageCount) {
//            for (NSInteger i = first; i < first + array.count; i++) {
//                JZYIImageView *imageView = self.imageMArray[i];
//                imageView.image = array[i - first];
//
//                if (i < (first + array.count - 1)) {
//                    CGRect rect = [self getAddImageViewFrame];
//                    JZYIImageView *add = [[JZYIImageView alloc] init];
//                    add.backgroundColor = [UIColor clearColor];
//                    add.frame           = rect;
//                    add.image = array[i - first];
//                    [add imageAddTap:self];
//                    [self addSubview:add];
//
//                    [self.imageMArray addObject:add];
//                }
//                CGRect rect = [self getAddImageViewFrame];
//
//                JZYIImageView *add = [[JZYIImageView alloc] init];
//                add.backgroundColor = [UIColor clearColor];
//                add.frame           = rect;
//                add.image = JZYI_IMAGE_PNG(@"jzyi_icon_add_image");
//                [add imageAddTap:self];
//
//                [self.imageMArray addObject:add];
//            }
//        }
//    }
//
//    if (array.count + first < self.maxImageCount) {
//        [self addSubview:[self addImageView]];
//        self.isLastSelect = NO;
//    }
//    else {
//        self.isLastSelect = YES;
//        [self getSelfHeight];
//
//    }
//}

//多张图片显示
- (void)refreshUIWithArray:(NSArray *)array
{
    self.isLastSelect = false;
    if (self.imageMArray.count <= 0) {
        [self addSubview:[self addImageView]];
    }
    else {
        NSInteger first = self.imageMArray.count - 1;
        for (NSInteger i = first; i < first + array.count; i++) {
            if (i < self.maxImageCount) {
                JZYIImageView *imageView = self.imageMArray[i];
                imageView.image = array[i - first];
                
                if (self.imageMArray.count < self.maxImageCount) {
                    [self addSubview:[self addImageView]];
                }
                else {
                    self.isLastSelect = true;
                }
            }
            else {
                self.isLastSelect = true;
            }
        }
    }
    
    [self getSelfHeight];
    [self resultChange];
    
    
    
//
//
//    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//
//    if (!array) {
//        [self addSubview:[self addImageView]];
//    }
//    else {
//
//        for (NSInteger i = 0; i < array.count; i++) {
//            if (i < self.maxImageCount) {
//                CGRect rect = [self getAddImageViewFrame];
//
//                JZYIImageView *add = [[JZYIImageView alloc] init];
//                add.backgroundColor = [UIColor clearColor];
//                add.frame           = rect;
//                add.image = array[i];
//                [add imageAddTap:self];
//                [self addSubview:add];
//
//                [self.imageMArray addObject:add];
//            }
//        }
//
//        if (array.count < self.maxImageCount) {
//            [self addSubview:[self addImageView]];
//            self.isLastSelect = NO;
//        }
//        else {
//            self.isLastSelect = YES;
//            [self getSelfHeight];
//        }
//    }
    
    
}

//结果变化，删除，添加，一次性赋值
- (void)resultChange
{
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.imageMArray.count; i++) {
        if (!self.isLastSelect && i == self.imageMArray.count - 1) {
            continue;
        }
        JZYIImageView *imageView = self.imageMArray[i];
        [mArray addObject:imageView.image];
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(selectImageChange:)]) {
        [_delegate selectImageChange:mArray];
    }
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters

- (JZYIImageView *)addImageView
{
    CGRect rect = [self getAddImageViewFrame];
    
    JZYIImageView *add = [[JZYIImageView alloc] init];
    add.backgroundColor = [UIColor clearColor];
    add.frame           = rect;
    add.image = [UIImage imageNamed:@"jzyi_icon_add_image_sp"];
    [add imageAddTap:self];
    
    [self.imageMArray addObject:add];
    
//    [self getSelfHeight];
    
    return add;
}

- (NSMutableArray *)imageMArray {
    if (!_imageMArray) {
        _imageMArray = [NSMutableArray array];
    }
    return _imageMArray;
}

- (JZYISelectImageView *)selectImageView {
    if (!_selectImageView) {
        _selectImageView = [[JZYISelectImageView alloc] init];
        _selectImageView.isUserEdit = NO;
        _selectImageView.maxNum = self.maxImageCount;
    }
    return _selectImageView;
}

- (JZYILookImageView *)lookImageCustomView{
    if (!_lookImageCustomView) {
        _lookImageCustomView  = [[JZYILookImageView alloc] init];
        _lookImageCustomView.delegate = self;
        _lookImageCustomView.showDelete = YES;
    }
    return _lookImageCustomView;
}
@end
