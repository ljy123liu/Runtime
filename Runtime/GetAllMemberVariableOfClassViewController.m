//
//  GetAllMemberVariableOfClassViewController.m
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//
/**
 *  最典型的用法就是一个对象在归档和解档的 encodeWithCoder和initWithCoder:方法中需要该对象所有的属性进行decodeObjectForKey: 和 encodeObject:，通过runtime我们声明中无论写多少个属性，都不需要再修改实现中的代码了。
 */
#import "GetAllMemberVariableOfClassViewController.h"
#import <objc/runtime.h>
#import "Person.h"
#import "Book.h"
#import "User.h"
#import "NSObject+JSONExtension.h"
@implementation GetAllMemberVariableOfClassViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getProperties];
    
    
}

//获取Person类中所有成员变量的名字和类型
- (void)getProperties {
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    
    //遍历所有成员变量
    for (int i = 0; i < outCount; i++) {
        //取出成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名:%s,成员变量类型%s",name,type);
    }
    //c语言，需要自己手动管理内存，注意释放内存
    free(ivars);
}

/// 字典转模型demo
- (void)json {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"model.json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    //    NSLog(@"json:%@",json);
    User *user = [User objectWithDict:json];
    //    NSLog(@"user:%@",user);
    Book *book = user.books[0];
    NSLog(@"book:%@",book);
    NSLog(@"%@",book.name);
}

/// 归解档demo
- (void)archiver {
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"temp.plist"];
    
    Person *person = [[Person alloc] init];
    
    // 归档
    person.name = @"人人";
    [NSKeyedArchiver archiveRootObject:person toFile:path];
    
    // 解档
    //    Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    //    NSLog(@"%@",person.name);
    //
    //    NSLog(@"%@",path);
}


@end
