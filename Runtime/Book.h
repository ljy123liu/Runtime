//
//  Book.h
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Book.h"

@interface Book : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) double price;
@property (nonatomic, copy) NSString *publisher;

@end
