//
//  DynamicAddMethodViewController.m
//  Runtime
//
//  Created by LIUYONG on 16/6/20.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "DynamicAddMethodViewController.h"
#import "Student.h"
@implementation DynamicAddMethodViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    Student *stu = [Student new];
    [stu performSelector:@selector(eat)];
}
@end
