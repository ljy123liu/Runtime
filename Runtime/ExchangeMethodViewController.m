//
//  ExchangeMethodViewController.m
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "ExchangeMethodViewController.h"
#import <objc/runtime.h>
#import "UIImage+Category.h"
@interface ExchangeMethodViewController ()

@end

@implementation ExchangeMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(15, 100, 100, 100)];
    button1.backgroundColor = [UIColor blueColor];
    [button1 setTitle:@"原方法" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(buttonClick1) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
    button2.backgroundColor = [UIColor redColor];
    [button2 setTitle:@"替换方法" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(buttonClick2) forControlEvents:UIControlEventTouchUpInside];
    
    //替换系统方法,当前使用的图片为5000,使用runtime替换为10000
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 250, 100, 50)];
    imageView.image = [UIImage imageNamed:@"5000"];
    [self.view addSubview:imageView];
    
}

- (void)buttonClick1 {
    [ExchangeMethodViewController run];
    [ExchangeMethodViewController study];
}

- (void)buttonClick2 {
    //获取两个类方法
    Method m1 = class_getClassMethod([ExchangeMethodViewController class], @selector(run));
    Method m2 = class_getClassMethod([ExchangeMethodViewController class], @selector(study));
    //开始交换方法实现
    method_exchangeImplementations(m1, m2);
    [ExchangeMethodViewController run];
    [ExchangeMethodViewController study];
}


+ (void)run {
    NSLog(@"run");
}

+ (void)study {
    NSLog(@"study");
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
