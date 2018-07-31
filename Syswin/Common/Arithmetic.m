//
//  Arithmetic.m
//  Syswin
//
//  Created by 王培荣 on 2017/4/15.
//  Copyright © 2017年 wangpeirong. All rights reserved.
//

#import "Arithmetic.h"

@implementation Arithmetic

#pragma - mark 快速排序
+ (void)quickSort:(NSMutableArray *)array low:(int)low high:(int)high
{
    if(array == nil || array.count == 0){
        return;
    }
    if (low >= high) {
        return;
    }
    
    //取中值
    int middle = low + (high - low)/2;
    NSNumber *prmt = array[middle];
    int i = low;
    int j = high;
    
    //开始排序，使得left<prmt 同时right>prmt
    while (i <= j) {
        //        while ([array[i] compare:prmt] == NSOrderedAscending) {  该行与下一行作用相同
        while ([array[i] intValue] < [prmt intValue]) {
            i++;
        }
        //        while ([array[j] compare:prmt] == NSOrderedDescending) { 该行与下一行作用相同
        while ([array[j] intValue] > [prmt intValue]) {
            j--;
        }
        
        if(i <= j){
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
            j--;
        }
        
        printf("排序中:");
        [self printArray:array];
    }
    
    //排中值左边的数
    if (low < j) {
        [self quickSort:array low:low high:j];
    }
    
    //排中值右边的数
    if (high > i) { //这里的high 与 i 的值,和上边递归函数(排中值左边的函数)中的值没关系,相当于这里走了俩个分支
        [self quickSort:array low:i high:high];
    }
}

#pragma - mark 冒泡排序
 /*  俩层循环来实现,外层控制循环次数,内层负责往后冒泡
     内层循环每次从第一个数开始,向后俩俩比较,将最大(或最小)的数冒到最后

  若n个数,共排序 (n-1) + (n-2) + ... + 1 次
  例如:   3个数,共排序  2 + 1 = 3  次;
  例如:   4个数,共排序  3 + 2 + 1 = 6 次;
  例如:   7个数,共排序  6 + 5 + 4 + 3 + 2 + 1 = 21 次;
  
  */
+ (void)buddleSort:(NSMutableArray *)array
{
    if(array == nil || array.count == 0){
        return;
    }

    for (int i = 1; i < array.count; i++) {
        for (int j = 0; j < array.count - i; j++) {
            if ([array[j] compare:array[j+1]] == NSOrderedDescending) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }

            printf("排序中:");
            [self printArray:array];
        }
    }
    
}

#pragma - mark 选择排序
/* /通过俩层循环来实现,外层控制循环次数,内层负责找最大(或最小)的数,放到最前面
    内层循环中,先取第一个数为基准,然后和第二个数比较,将较大者给到基准数,然后用基准数和第三个比较,大的放前面,依次类推
    第二层循环,再取第二个数为基准,一直往后找,将次大的数放到第二个...
 
 
 */
+ (void)selectSort:(NSMutableArray *)array
{
    if(array == nil || array.count == 0){
        return;
    }

    int min_index;
    for (int i = 0; i < array.count; i++) {
        min_index = i;
        for (int j = i + 1; j<array.count; j++) {
            if ([array[j] compare:array[min_index]] == NSOrderedAscending) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:min_index];
            }

            printf("排序中:");
            [self printArray:array];
        }
    }
}

#pragma - mark 插入排序
+ (void)inserSort:(NSMutableArray *)array
{
    if(array == nil || array.count == 0){
        return;
    }
    
    for (int i = 1; i < array.count; i++) {//先默认第一个元素就是排好的一个有序数列,从第二个数开始,为待插元素
        NSNumber *temp = array[i];//temp 为待插元素
        int j = i-1;    //j 为有序数列最后的位置
        
        while (j >= 0 && [array[j] compare:temp] == NSOrderedDescending) {
            [array replaceObjectAtIndex:j+1 withObject:array[j]];
            j--;
            
            printf("排序中:");
            [self printArray:array];
        }
        
        [array replaceObjectAtIndex:j+1 withObject:temp];
    }
}

+ (void)printArray:(NSArray *)array
{
    for(NSNumber *number in array) {
        printf("%d ",[number intValue]);
    }
    
    printf("\n");
}

@end
