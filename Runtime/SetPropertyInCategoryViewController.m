//
//  SetPropertyInCategoryViewController.m
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "SetPropertyInCategoryViewController.h"
#import "NSObject+Property.h"
@implementation SetPropertyInCategoryViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSObject *object = [NSObject new];
    object.name = @"分类的属性";
//    object.age = @"10";
    
    NSLog(@"%@",object.name);
//    NSLog(@"%@",object.age);
}
@end
