//
//  DataBase.m
//  Syswin
//
//  Created by 王培荣 on 2017/4/18.
//  Copyright © 2017年 wangpeirong. All rights reserved.
//

#import "DataBase.h"

@implementation DataBase

- (void)insertInstance
{
    NSString *path = @"insert into TableName(name ,gender ,age , number) values('%@' ,'%@' , '%ld' , '%ld')";
    
    @"delete from TableName where age > 5";
    
    @"update lanOuStudent set age = '%ld' where name = '%@'";
    
    @"select * from lanOuStudent where name = '%@' and age = '%ld'";
    
    
}



@end
