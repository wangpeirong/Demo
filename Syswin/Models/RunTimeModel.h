//
//  RunTimeModel.h
//  Syswin
//
//  Created by 王培荣 on 2018/7/31.
//  Copyright © 2018年 wangpeirong. All rights reserved.
//  字典转模型

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface RunTimeModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) NSInteger age;

//模型中嵌套UserModel模型
@property (nonatomic, strong) UserModel *user;

@end


