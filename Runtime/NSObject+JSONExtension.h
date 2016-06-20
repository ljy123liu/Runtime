//
//  NSObject+JSONExtension.m
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONExtension)

- (void)setDict:(NSDictionary *)dict;
+ (instancetype )objectWithDict:(NSDictionary *)dict;
// 告诉数组中都是什么类型的模型对象
- (NSString *)arrayObjectClass ;
@end
