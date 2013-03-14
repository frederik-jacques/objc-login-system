//
//  LoginView.h
//  LoginExample
//
//  Created by Frederik Jacques on 13/03/13.
//  Copyright (c) 2013 thenerd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LoginView : UIView

@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) UITextField *txtUsername;
@property (nonatomic, strong) UITextField *txtPassword;
@property (nonatomic, strong) UIButton *btnLogin;

- (void)showAlert;

@end
