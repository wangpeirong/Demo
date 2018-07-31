//
//  SysAlertTool.m
//  Syswin
//
//  Created by wangpeirong on 15/6/1.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

#import "SysAlertTool.h"
@interface SysAlertTool ()<UIAlertViewDelegate>
{
    UIAlertView_block_index ablock;
}
@end

@implementation SysAlertTool

+ (SysAlertTool *)shareAlert
{
    static SysAlertTool *shareAlert;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (shareAlert == nil) {
            shareAlert = [[SysAlertTool alloc]init];
        }
    });
    return shareAlert;
    
}
- (void)showAlertViewWithMessage:(NSString *)message confirm:(NSString *)confirmStr cancle:(NSString *)cancleStr alertBlock:(UIAlertView_block_index)alertBlock
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"系统提示" message:message delegate:self cancelButtonTitle:cancleStr otherButtonTitles:confirmStr, nil];
    ablock = alertBlock;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (ablock) {
        ablock(alertView,buttonIndex);
    }
}

@end
