//
//  ImageCacheViewController.m
//  Syswin
//
//  Created by 王培荣 on 2017/3/29.
//  Copyright © 2017年 wangpeirong. All rights reserved.
//

#import "ImageCacheViewController.h"

@interface ImageCacheViewController ()

@end

@implementation ImageCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t queueQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//并行
    dispatch_queue_t queueW = dispatch_get_main_queue();//串行
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

char * myStrcpo(char *strA, const char *strB)
{
    assert(strA != NULL && strB != NULL);
    
    char address = strA;
    
    while ((*strA++ = *strB++) != '\0');
    
    return address;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
