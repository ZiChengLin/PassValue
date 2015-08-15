//
//  InstanceHandle.h
//  传值PassedValue
//
//  Created by 林梓成 on 15/8/6.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InstanceHandle : NSObject

@property (nonatomic, strong) NSString *valueString;

// 单例
+ (InstanceHandle *)defaultInstance;

@end
