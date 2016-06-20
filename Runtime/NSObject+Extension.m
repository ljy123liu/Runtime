//
//  NSObject+Extension.m
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>
@implementation NSObject (Extension)
- (void)decode:(NSCoder *)aDecoder {
    
    //一层层父类往上查找，对父类的属性执行解归档方法
    Class c = self.class;
    while (c && c != [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(c, &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //如果有该方法再去调用
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) {
                    continue;
                }
            }
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
        c = [c superclass];
    }
}

- (void)encode:(NSCoder *)aCoder {
    //一层层父类往上查找，对父类的属性执行归解档方法
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //如果有该方法再去调用
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) {
                    continue;
                }
            }
            id value = [self valueForKeyPath:key];
            [aCoder encodeObject:value forKey:key];
        }
        free(ivars);
        c = [c superclass];
    }
}
@end