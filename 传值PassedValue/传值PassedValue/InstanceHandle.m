//
//  InstanceHandle.m
//  传值PassedValue
//
//  Created by 林梓成 on 15/8/6.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import "InstanceHandle.h"

@implementation InstanceHandle

+ (InstanceHandle *)defaultInstance {
    
    static InstanceHandle *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[InstanceHandle alloc] init];
    });
    return instance;
}

@end
