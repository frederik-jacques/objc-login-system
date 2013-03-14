//
//  LoginView.m
//  LoginExample
//
//  Created by Frederik Jacques on 13/03/13.
//  Copyright (c) 2013 thenerd. All rights reserved.
//

#import "LoginView.h"
#import "ImageFactory.h" 

@implementation LoginView

@synthesize background = _background;
@synthesize txtUsername = _txtUsername;
@synthesize txtPassword = _txtPassword;
@synthesize btnLogin = _btnLogin;

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    
    if (self) {
        NSLog(@"[LoginView] Init");
        self.backgroundColor = [UIColor colorWithRed:62/255.0 green:69/255.0 blue:76/255.0 alpha:1];
        
        [self createBackground];
        [self createUsernameTextField];
        [self createPasswordTextField];
        [self createLoginButton];
    }
    
    return self;
}

- (void)createBackground {
    UIImage *image = [ImageFactory createImageWithPathForResource:@"login_frame_background" ofType:@"png" inDirectory:@"images"];
    
    self.background = [[UIImageView alloc] initWithImage:image];
    self.background.frame = CGRectMake(15, 20, image.size.width, image.size.height);
    [self addSubview:self.background];
}

- (void)createUsernameTextField {
    self.txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(35, 80, 250, 30)];
    self.txtUsername.placeholder = @"e-mail";
    [self addSubview:self.txtUsername];
}

- (void)createPasswordTextField {
    self.txtPassword = [[UITextField alloc] initWithFrame:CGRectMake(35, 125, 250, 30)];
    self.txtPassword.secureTextEntry = YES;
    self.txtPassword.placeholder = @"password";
    [self addSubview:self.txtPassword];
}

- (void)createLoginButton {
    UIImage *image = [ImageFactory createImageWithPathForResource:@"login_button" ofType:@"png" inDirectory:@"images"];
        
    self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogin.frame = CGRectMake(30, 165, image.size.width, image.size.height);
    [self.btnLogin setBackgroundImage:image forState:UIControlStateNormal];
    [self.btnLogin addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnLogin];
}

- (void)loginButtonClicked:(id)sender {
    NSLog(@"[LoginView] Login button clicked");

    [self hideKeyboard];
    
    NSDictionary *loginDict = [NSDictionary dictionaryWithObjectsAndKeys:self.txtUsername.text, @"username", self.txtPassword.text, @"password", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:AUTHENTICATE_NOTIFICATION object:self userInfo:loginDict];
}

- (void)hideKeyboard {
    [self.txtUsername resignFirstResponder];
    [self.txtPassword resignFirstResponder];
}

- (void)showAlert {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Woops..." message:@"Username or password was not correct" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.txtUsername.text = @"";
    self.txtPassword.text = @"";
}

- (void)dealloc {
    NSLog(@"[LoginView] Dealloc");
}

@end
