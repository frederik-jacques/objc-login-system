//
//  MainView.m
//  LoginExample
//
//  Created by Frederik Jacques on 13/03/13.
//  Copyright (c) 2013 thenerd. All rights reserved.
//

#import "MainView.h"
#import "ImageFactory.h"

@implementation MainView

@synthesize imageView = _imageView;
@synthesize btnLogout = _btnLogout;

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        [self createBackground];
        [self createLogoutButton];
    }
    
    return self;
}


- (void)createBackground {
    UIImage *image = [ImageFactory createImageWithPathForResource:@"bg" ofType:@"png" inDirectory:@"images"];
    
    self.imageView = [[UIImageView alloc] initWithImage:image];
    [self addSubview:self.imageView];
}

- (void)createLogoutButton {
    
    UIImage *image = [ImageFactory createImageWithPathForResource:@"logout_button" ofType:@"png" inDirectory:@"images"];
    
    self.btnLogout = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnLogout setImage:image forState:UIControlStateNormal];
    self.btnLogout.frame = CGRectMake(25, 25, image.size.width, image.size.height);
    [self.btnLogout addTarget:self action:@selector(logoutClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnLogout];
}

- (void)logoutClicked:(id)sender {
    NSLog(@"[MainView] Logout clicked");
    
    [[NSNotificationCenter defaultCenter] postNotificationName:LOGOUT_NOTIFICATION object:self];
}

- (void)dealloc {
    NSLog(@"[MainView] Dealloc");
}

@end
