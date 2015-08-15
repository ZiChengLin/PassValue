//
//  FirstViewController.m
//  传值PassedValue
//
//  Created by 林梓成 on 15/8/6.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import "FirstViewController.h"
#import "InstanceHandle.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.title = self.valueString;
   
    InstanceHandle *instance = [InstanceHandle defaultInstance];
    self.title = instance.valueString;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initPassValueBtn];
}

- (void)initPassValueBtn {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 40);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"代理传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnAction:(UIButton *)btn {
    
    [self.delegate passValue:@"传值"];
    
    // 通知第二步（在返回要接收值的方法中写）
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"通知",@"key", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"lin" object:nil userInfo:dic];
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
