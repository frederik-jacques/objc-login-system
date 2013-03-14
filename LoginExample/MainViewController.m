//
//  MainViewController.m
//  LoginExample
//
//  Created by Frederik Jacques on 13/03/13.
//  Copyright (c) 2013 thenerd. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "LoginViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
        NSLog(@"[MainViewController] Init");
        
    }
    
    return self;
}

- (void)loadView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    MainView *v = [[MainView alloc] initWithFrame:frame];
    [self setView:v];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"[MainViewController] View did load");
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutHandler:) name:LOGOUT_NOTIFICATION object:self.view];
}

- (void)viewDidAppear:(BOOL)animated {
    BOOL isUserLoggedIn = [[NSUserDefaults standardUserDefaults] boolForKey:@"userLoggedIn"];
    
    if( !isUserLoggedIn ){
        [self showLoginViewAnimated:NO];
    }
}

- (void)logoutHandler:(NSNotification *)notification {
    NSLog(@"[MainViewController] Logout handler");
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"userLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self showLoginViewAnimated:YES];
}

- (void)showLoginViewAnimated:(BOOL)animated {
    NSLog(@"[MainViewController] Show login view controller");
    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:loginVC animated:animated completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"[MainViewController] Dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LOGOUT_NOTIFICATION object:self.view];
}

@end
