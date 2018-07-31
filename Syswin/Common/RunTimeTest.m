//
//  RunTimeTest.m
//  Syswin
//
//  Created by 王培荣 on 2017/3/31.
//  Copyright © 2017年 wangpeirong. All rights reserved.
//

#import "RunTimeTest.h"
#import <objc/runtime.h>

@interface RunTimeTest ()

@property (nonatomic, retain) NSString *name;
@property (nonatomic, copy  ) NSString *age;

@end

@implementation RunTimeTest

//手动实现set方法
//-(void)setName:(NSString *)name
//{
//    if (_name != name) {
//        
//        [_name releale];
//        _name = [name retain];
//    }
//}


///通过运行时获取当前对象的所有属性的名称，以数组的形式返回
- (NSArray *) allPropertyNames{
    ///存储所有的属性名称
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    
    ///存储属性的个数
    unsigned int propertyCount = 0;
    
    ///通过运行时获取当前类的属性
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    
//    Ivar *ivarList = class_copyIvarList([self class],&propertyCount);//这个是获取类的成员变量
    
    
    //把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        ///取出第一个属性
        objc_property_t property = propertys[i];
        
        const char * propertyName = property_getName(property);
        
        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
    }
    
    ///释放
    free(propertys);
    
    return allNames;
}

- (NSArray *)allKeys
{
    NSMutableArray *keys = [NSMutableArray array];
    
    unsigned int count;
    unsigned int index;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (index = 0; index < count; index++) {
        
        objc_property_t property = properties[index];
        
        //字段名称
        NSString *propertyName = [NSString stringWithFormat:@"%s",property_getName(property)];
        [keys addObject:propertyName];
    }
    
    return [keys copy];
}

- (NSDictionary *)convertModelToDictionary
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    for (NSString *key in [self allKeys]) {
        
        id propertyValue = [self valueForKey:key];
        
        if (propertyValue != nil) {
            [dic setObject:propertyValue forKey:key];
        }
    }
    
    return dic;
    
    
}





@end
