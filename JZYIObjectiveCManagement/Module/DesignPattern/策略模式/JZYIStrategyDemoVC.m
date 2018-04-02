//
//  JZYIStrategyDemoVC.m
//  JZYIObjectiveCManagement
//
//  Created by LiYouCheng on 2018/4/2.
//  Copyright © 2018年 KAISA. All rights reserved.
//

#import "JZYIStrategyDemoVC.h"

#import "JZYICustomTextField.h"
#import "JZYICustomPhoneValidator.h"
#import "JZYICustomPasswordValidator.h"

@interface JZYIStrategyDemoVC ()
<UITextFieldDelegate>

@property (nonatomic, strong) JZYICustomTextField *phoneTextField;
@property (nonatomic, strong) JZYICustomTextField *passwordTextField;

@end

@implementation JZYIStrategyDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setupStrategyDemoVC];
    [self p_setupConstraints];
}

- (void)p_setupStrategyDemoVC
{
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.passwordTextField];
}

- (void)p_setupConstraints
{
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(-100);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.phoneTextField.mas_centerY).offset(100);
    }];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    JZYICustomTextField *customTextField = (JZYICustomTextField *)textField;
    if (![customTextField validate]) {
        NSLog(@"error = %@",customTextField.inputValidator.errorMessage);
    }
}

- (JZYICustomTextField *)phoneTextField {
    if (!_phoneTextField) {
        _phoneTextField = [[JZYICustomTextField alloc] initWithFrame:CGRectZero];
        _phoneTextField.backgroundColor = [UIColor greenColor];
        _phoneTextField.delegate = self;
        _phoneTextField.inputValidator = [JZYICustomPhoneValidator new];
    }
    return _phoneTextField;
}

- (JZYICustomTextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[JZYICustomTextField alloc] initWithFrame:CGRectZero];
        _passwordTextField.backgroundColor = [UIColor greenColor];
        _passwordTextField.delegate = self;
        _passwordTextField.inputValidator = [JZYICustomPasswordValidator new];
    }
    return _passwordTextField;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
