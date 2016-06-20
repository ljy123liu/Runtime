//
//  Dog.h
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject <NSCoding>
@property (nonatomic, strong) NSString *like;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) BOOL pet;
@end
