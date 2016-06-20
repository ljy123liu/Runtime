//
//  NSObject+Property.h
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)
//使用runtime设置分类的属性
@property (nonatomic, strong) NSString *name;

//分类中是无法设置属性的，如果在分类的声明中写@property 只能为其生成get 和 set 方法的声明，但无法生成成员变量，就是虽然点语法能调用出来，但程序执行后会crash
@property (nonatomic, strong) NSString *age;
@end
