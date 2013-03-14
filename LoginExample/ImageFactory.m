//
//  ImageFactory.m
//  LoginExample
//
//  Created by Frederik Jacques on 13/03/13.
//  Copyright (c) 2013 thenerd. All rights reserved.
//

#import "ImageFactory.h"

@implementation ImageFactory

+ (UIImage *)createImageWithPathForResource:(NSString *)path ofType:(NSString *)type {
        
    return [self createImageWithPathForResource:path ofType:type inDirectory:nil];
    
}

+ (UIImage *)createImageWithPathForResource:(NSString *)path ofType:(NSString *)type inDirectory:(NSString *)directory{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:path ofType:type inDirectory:directory];
    
    return [UIImage imageWithContentsOfFile:filePath];
}

@end
