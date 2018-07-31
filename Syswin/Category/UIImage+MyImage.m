//
//  UIImage+MyImage.m
//  Syswin
//
//  Created by 王培荣 on 2018/7/30.
//  Copyright © 2018年 wangpeirong. All rights reserved.
//

#import "UIImage+MyImage.h"
#import <objc/runtime.h>

@implementation UIImage (MyImage)

+ (void)initialize
{
    if (self == [self class]) {
        NSLog(@"初始化");
    }
}
+ (void)load
{
    
    NSLog(@"load方法");
    
    Method systomMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method myMethod     = class_getClassMethod(self, @selector(my_imageNamed:));
    
//    method_exchangeImplementations(systomMethod, myMethod);
}


+(UIImage *)my_imageNamed:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    
    
    if (image) {
        
        NSLog(@"图片加载成功");
    }else{
        NSLog(@"图片加载失败");
    }
    return image;
}

@end
