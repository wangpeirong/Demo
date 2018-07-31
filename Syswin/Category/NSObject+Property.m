//
//  NSObject+Property.m
//  Syswin
//
//  Created by 王培荣 on 2018/7/31.
//  Copyright © 2018年 wangpeirong. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

-(void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)name
{
    return objc_getAssociatedObject(self, @"name");
}


@end
