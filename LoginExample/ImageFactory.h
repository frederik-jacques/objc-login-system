//
//  ImageFactory.h
//  LoginExample
//
//  Created by Frederik Jacques on 13/03/13.
//  Copyright (c) 2013 thenerd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFactory : NSObject

+ (UIImage *)createImageWithPathForResource:(NSString *)path ofType:(NSString *)type;
+ (UIImage *)createImageWithPathForResource:(NSString *)path ofType:(NSString *)type inDirectory:(NSString *)directory;

@end
