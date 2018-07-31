//
//  SysAlertTool.h
//  Syswin
//
//  Created by wangpeirong on 15/6/1.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

typedef void(^UIAlertView_block_index)(UIAlertView *alertView,NSInteger btnIndex);
#import <Foundation/Foundation.h>

@interface SysAlertTool : NSObject
+ (SysAlertTool *)shareAlert;
- (void)showAlertViewWithMessage:(NSString *)message confirm:(NSString *)confirmStr cancle:(NSString *)cancleStr alertBlock:(UIAlertView_block_index)alertBlock;

@end
