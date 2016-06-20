//
//  Cat.h
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Fish.h"

@interface Cat : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) double price;
// 属性是一个对象
@property (nonatomic,strong) Fish *fish;

@end
