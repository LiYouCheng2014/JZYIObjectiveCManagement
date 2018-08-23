//
//  JZYISelectImageView.m
//  JZYSmartCommunityOwner
//
//  Created by YouchengLi on 2017/11/18.
//  Copyright © 2017年 liyoucheng. All rights reserved.
//

#import "JZYISelectImageView.h"

//#import "JZYIUtilsMacros.h"
//#import "UIColor+JZYITool.h"
//#import "UIFont+JZYITool.h"

//系统提示
#import <JZYItool/JZYICommon.h>
#import <JZYItool/JZYIBaseInfo.h>

#import "JZYIBasicUI.h"

#import "JZYISystemPromptManagement.h"

#import <TZImagePickerController/TZImagePickerController.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

@interface JZYISelectImageView ()
<UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
TZImagePickerControllerDelegate>

@property (nonatomic, strong) UIWindow *keyWindow;
@property (nonatomic, strong) JZYIView *selectView;
@property (nonatomic, strong) UIViewController *keyVC;
@property (nonatomic, weak) id<JZYISelectImageViewDelegate> delegate;

@end

@implementation JZYISelectImageView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.keyWindow = [UIApplication getKeyWindow];
        self.keyVC = self.keyWindow.rootViewController;
        self.frame = self.keyWindow.bounds;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        self.isUserEdit = YES;
        self.scale = 2;
        self.maxNum = 1;
        
        [self addSubview:self.selectView];
        
        [self p_setupConstraints];
    }
    return self;
}

- (void)p_setupConstraints
{
    [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@190.f);
        make.width.equalTo(self.mas_width);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.selectView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom);
    }];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CGFloat TW = image.size.width;
    CGFloat TH = image.size.height;

    // 改变大小
    if (_scale >= 1)
    {
        if (TW > TH)
        {
            if (TW > 512)
            {
                TH = 512 / TW * TH;
                TW = 512;
            }
        }
        else
        {
            if (TH > 512)
            {
                TW = 512 / TH * TW;
                TH = 512;
            }
        }
    }
    else
    {
        TW *= _scale;
        TH *= _scale;
    }

    CGRect rect = CGRectMake(0, 0, TW, TH);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();


    if (_delegate && [_delegate respondsToSelector:@selector(jzyi_addSelectImageArray:)]) {
        [_delegate jzyi_addSelectImageArray:@[ image ]];
    }
}

#pragma mark - TZImagePickerControllerDelegate

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto
{
    if (_delegate && [_delegate respondsToSelector:@selector(jzyi_addSelectImageArray:)]) {
        [_delegate jzyi_addSelectImageArray:photos];
    }
}

//即日起（2017年3月8日)，请按照此顺序书写代码，以便统一
#pragma mark - 1、生命周期函数 life cycle

#pragma mark - 2、系统代理 system delegate

#pragma mark - 3、自定义代理 custom delegete

#pragma mark - 4、相关响应事件 event response
- (void)pushSystemSet:(BOOL)isCamera{
    
    if (@available(iOS 10.0, *)) {
        //ios11无效果
        NSURL *url = [NSURL URLWithString:isCamera ? @"App-Prefs:root=Privacy&path=CAMERA" : @"App-Prefs:root=Privacy&path=PHOTOS"];
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                
            }];
            
        }
    }
    else {
        NSURL *url = [NSURL URLWithString:isCamera ? @"prefs:root=Privacy&path=CAMERA" : @"prefs:root=Privacy&path=PHOTOS"];
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
            
        }
    }
}

- (void)clickedSelectImage:(UIButton *)btn {
    if (btn.tag == 1000) {
        [self hideView];
        
        JZYI_WEAK_SELF(self);
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    JZYI_STRONG_SELE(self);
                    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                    [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
                    //            [imagePicker setMediaTypes:[[NSArray alloc] initWithObjects:(NSString*)kUTTypeImage, nil]];
                    [imagePicker setDelegate:strongself];
                    imagePicker.allowsEditing = strongself.isUserEdit;
                    
                    /*
                     * 做兼容，可能当前的ViewController是由根控制器present出来的，所以弹出选择照片的这个控制器应该是由当前present出来的控制器弹出，而不是当前的rootViewController弹出。如果rootViewController没有presentedViewController,那么就直接由rootViewController弹出。
                     *
                     */
                    UIViewController *presentViewController = strongself.keyVC.presentedViewController;
                    if (presentViewController) {
                        
                        [presentViewController presentViewController:imagePicker animated:YES completion:nil];
                    }
                    else {
                        
                        [self.keyVC presentViewController:imagePicker animated:YES completion:nil];
                    }
              
                });
       
                
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [JZYISystemPromptManagement showAlertViewWithTitle:@"使用拍照需要先开启相机哦~" message:nil cancelButtonTitle:nil otherButtonTitles:@[ @"我再转转",@"现在就去" ] clickAtIndex:^(NSInteger buttonIndex) {
                        if (buttonIndex == 1) {
                            [self pushSystemSet:true];
                        }
                    }];
                });
            }
        }];
    }
    else if (btn.tag == 1001) {
        [self hideView];
        
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    TZImagePickerController *vc = [[TZImagePickerController alloc] initWithMaxImagesCount:self.maxNum delegate:self];
                    /*
                     * 做兼容，可能当前的ViewController是由根控制器present出来的，所以弹出选择照片的这个控制器应该是由当前present出来的控制器弹出，而不是当前的rootViewController弹出。如果rootViewController没有presentedViewController,那么就直接由rootViewController弹出。
                     *
                     */
                    UIViewController *presentViewController = self.keyVC.presentedViewController;
                    if (presentViewController) {
                        
                        [presentViewController presentViewController:vc animated:YES completion:nil];
                    }
                    else {
                        
                        [self.keyVC presentViewController:vc animated:YES completion:nil];
                    }
                 
                });

            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [JZYISystemPromptManagement showAlertViewWithTitle:@"使用相册需要先开启相册哦~" message:nil cancelButtonTitle:nil otherButtonTitles:@[ @"我再转转",@"现在就去" ] clickAtIndex:^(NSInteger buttonIndex) {
                        if (buttonIndex == 1) {
                            [self pushSystemSet:false];
                        }
                    }];
                });
            }
        }];
    }
    else if (btn.tag == 1002) {
        //取消
        [self hideView];
    }
}

- (BOOL)isCanUsePhotos {
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusAuthorized) {
        return true;
    }
    return YES;
}

#pragma mark - 5、自定义函数 private methods

- (void)showView:(id<JZYISelectImageViewDelegate>)delegate {
    self.delegate = delegate;
    
    [self layoutIfNeeded];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [self.selectView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(-190.f);
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
}

- (void)hideView {
    [self layoutIfNeeded];
    
    [self.selectView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom);
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.delegate = nil;
        [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hideView];
}

#pragma mark - 6、初始化（统一用懒加载） getters or setters

- (JZYIView *)selectView { 
    if (!_selectView) {
        _selectView = [JZYIView setupViewWithFrame:CGRectZero backgroundColr:[UIColor getColor:@"f8f8f8"] borderWidth:0 borderColor:nil cornerRadius:0];

        NSArray *array = @[ @"拍照",@"从手机相册选择",@"取消" ];
        JZYIButton *lastButton = nil;
        for (NSInteger i = 0; i < 3; i++) {
            JZYIButton *tempButton = [JZYIButton setupButtonWithFrame:CGRectZero font:[UIFont fontFor32] target:self action:@selector(clickedSelectImage:) borderWidth:0 borderColor:nil cornerRadius:0];
            tempButton.tag = 1000 + i;
            tempButton.backgroundColor = [UIColor whiteColor];
            [tempButton setTitleColor:[UIColor getColor:@"404040"] forState:UIControlStateNormal];
            [tempButton setTitle:array[i] forState:UIControlStateNormal];
            [_selectView addSubview:tempButton];
            
            JZYIView *lineView = [JZYIView setupViewWithFrame:CGRectZero backgroundColr:[UIColor getColor:@"eaeaea"] borderWidth:0 borderColor:nil cornerRadius:0];
            [_selectView addSubview:lineView];
            
            [tempButton mas_makeConstraints:^(MASConstraintMaker *make) {
                if (lastButton) {
                    if (i == 2) {
                        make.top.equalTo(lastButton.mas_bottom).offset(10.f);
                    }
                    else {
                        make.top.equalTo(lastButton.mas_bottom);
                    }
                }
                else {
                    make.top.equalTo(self.selectView.mas_top);
                }
                
                make.width.equalTo(self.selectView.mas_width);
                make.centerX.equalTo(self.selectView.mas_centerX);
                make.height.equalTo(@60.f);
            }];
            
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(tempButton.mas_bottom);
                make.height.equalTo(@([JZYIUiInfo getLineWidth]));
                make.centerX.equalTo(tempButton.mas_centerX);
                make.width.equalTo(tempButton.mas_width);
            }];
            
            lastButton = tempButton;
        }
    }
    return _selectView;
}

@end
