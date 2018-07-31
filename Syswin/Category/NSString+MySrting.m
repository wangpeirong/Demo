//
//  NSString+MySrting.m
//  Syswin
//
//  Created by 王培荣 on 2018/7/30.
//  Copyright © 2018年 wangpeirong. All rights reserved.
//

#import <objc/runtime.h>
#import "NSString+MySrting.h"

@implementation NSString (MySrting)

-(void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setNickName:(NSString *)nickName
{
    objc_setAssociatedObject(self, @"nickName", nickName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)name
{
   return  objc_getAssociatedObject(self, @"name");
}

- (NSString *)nickName
{
//    return objc_getAssociatedObject(self, @"nickName");
    return @"晚餐有点过分";
}

@end
