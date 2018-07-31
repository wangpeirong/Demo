//
//  SysPublicClass.h
//  Syswin
//
//  Created by wangpeirong on 15/5/28.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

typedef void(^SureAlertAction)(NSInteger buttonIndex);

#import <Foundation/Foundation.h>

@interface SysPublicClass : NSObject
+ (id)sharedInstance;
//验证邮箱
+ (BOOL) validateEmail:(NSString *)email;
//验证手机号
- (BOOL)validateMobile:(NSString *)mobileNum;
//判断电话号码 (暂时没用到)
+ (BOOL)isMobileNumber:(NSString *)number;

//验证用户名是否有效
+ (BOOL)isValidateUserName:(NSString*)userName;
//验证密码是否有效
+ (BOOL)isValidatePassWord:(NSString*)passWord;

//添加警告框
+ (void)showAlerttViewWithText:(NSString*)text sureBlock:(SureAlertAction)sureBlock;

@end
