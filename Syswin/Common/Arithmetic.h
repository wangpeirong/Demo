//
//  Arithmetic.h
//  Syswin
//
//  Created by 王培荣 on 2018/7/18.
//  Copyright © 2017年 wangpeirong. All rights reserved.
//  算法类

#import <Foundation/Foundation.h>

@interface Arithmetic : NSObject

//快速排序
+ (void)quickSort:(NSMutableArray *)array low:(int)low high:(int)high;

//冒泡排序
+ (void)buddleSort:(NSMutableArray *)array;

//选择排序
+ (void)selectSort:(NSMutableArray *)array;

//插入排序
+ (void)inserSort:(NSMutableArray *)array;

//打印数组
+ (void)printArray:(NSArray *)array;


@end
