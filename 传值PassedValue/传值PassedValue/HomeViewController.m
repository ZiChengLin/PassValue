//
//  HomeViewController.m
//  传值PassedValue
//
//  Created by 林梓成 on 15/8/6.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import "HomeViewController.h"
#import "FirstViewController.h"
#import "InstanceHandle.h"

@interface HomeViewController ()<PassValueDelegate>
{
    UILabel *label;
    FirstViewController *firstViewController;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"HOME";
    
    [self initPassValueBtn];
    [self initPassValueLabel];
}

- (void)initPassValueBtn {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 40);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"属性传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)initPassValueLabel {
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(100, 400, 100, 40)];
    label.backgroundColor = [UIColor brownColor];
    [self.view addSubview:label];
}

- (void)btnAction:(UIButton *)btn {
    
    firstViewController = [[FirstViewController alloc] init];
    //firstViewController.valueString = @"FIRST";
    InstanceHandle *instance = [InstanceHandle defaultInstance];
    instance.valueString = self.title;
    
    firstViewController.delegate = self;
    [self.navigationController pushViewController:firstViewController animated:YES];
    
    // 注册通知（先在跳转的地方注册通知、通常那个地方要接收值就在哪个地方注册通知）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doNotification:) name:@"lin" object:nil];
}

- (void)doNotification:(NSNotification *)notification {
    
    // 通知第三步 将通知回来的值从字典里面取出来
    NSDictionary *dic = notification.userInfo;
    self.title = [dic valueForKey:@"key"];
    
    // 通知第四步 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"lin" object:nil];
}

- (void)passValue:(NSString *)string {
    
    label.text = string;
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
