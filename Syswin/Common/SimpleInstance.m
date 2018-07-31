//
//  SimpleInstance.m
//  Syswin
//
//  Created by 王培荣 on 2017/4/15.
//  Copyright © 2017年 wangpeirong. All rights reserved.
//  单利

#import "SimpleInstance.h"

@implementation SimpleInstance

static id _instance = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });

    return _instance;
}

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;

}
- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}





@end
