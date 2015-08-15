//
//  FirstViewController.h
//  传值PassedValue
//
//  Created by 林梓成 on 15/8/6.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PassValueDelegate <NSObject>

- (void) passValue:(NSString *)string;

@end

@interface FirstViewController : UIViewController

@property (nonatomic, strong) NSString *valueString;    // 用于进行属性传值的属性

@property (nonatomic, assign) id<PassValueDelegate> delegate;

@end
