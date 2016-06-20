//
//  UIImage+Category.m
//  Runtime
//
//  Created by LIUYONG on 16/6/19.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//
/**
 *  替换系统方法
 *
 *  @param Category <#Category description#>
 *
 *  @return <#return value description#>
 */

#import "UIImage+Category.h"
#import <objc/runtime.h>
@implementation UIImage (Category)
+ (void)load {
    //获取两个类方法
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(ly_imageNamed:));
    //交换
    method_exchangeImplementations(m1, m2);
}

+ (UIImage *)ly_imageNamed:(NSString *)name {
    
    //版本图片替换
//    double version = [[UIDevice currentDevice].systemVersion doubleValue];
//    if (version >= 7.0) {
//        // 如果系统版本是7.0以上，使用另外一套文件名结尾是‘_os7’的扁平化图片
//        name = [name stringByAppendingString:@"_os7"];
//    }
    name = @"10000";
    
    //注意：自定义方法中最后一定要再调用一下系统的方法，让其有加载图片的功能，但是由于方法交换，系统的方法名已经变成了我们自定义的方法名（有点绕，就是用我们的名字能调用系统的方法，用系统的名字能调用我们的方法），这就实现了系统方法的拦截！
    return [UIImage ly_imageNamed:name];
}
@end
