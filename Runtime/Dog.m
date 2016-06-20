//
//  Dog.m
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "Dog.h"
#import "NSObject+Extension.h"
@implementation Dog
//设置需要忽略的属性
- (NSArray *)ignoredNames {
    return @[@"sex"];
}

//在系统方法内来调用自定义方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

@end
