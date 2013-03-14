//
//  LoginViewController.m
//  LoginExample
//
//  Created by Frederik Jacques on 13/03/13.
//  Copyright (c) 2013 thenerd. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    LoginView *v = [[LoginView alloc] initWithFrame:frame];
    [self setView:v];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(authenticateHandler:) name:AUTHENTICATE_NOTIFICATION object:self.view];
}

#define username @"frederik"
#define password @"test"
- (void)authenticateHandler:(NSNotification *)notification {
    NSLog(@"[LoginViewController] Authenticate handler");
    
    NSDictionary *userDict = [notification userInfo];
    
    BOOL isUserAuthenticated = [username isEqualToString:[userDict objectForKey:@"username"]] &&
    [password isEqualToString:[userDict objectForKey:@"password"]];
    
    [[NSUserDefaults standardUserDefaults] setBool:isUserAuthenticated forKey:@"userLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if( isUserAuthenticated ){
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }else{
        LoginView *v = (LoginView *)self.view;
        [v showAlert];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"[LoginViewController] Dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AUTHENTICATE_NOTIFICATION object:self.view];
}

@end
