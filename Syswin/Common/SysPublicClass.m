//
//  SysPublicClass.m
//  Syswin
//
//  Created by wangpeirong on 15/5/28.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

#import "SysPublicClass.h"
#import "SysAlertTool.h"

@implementation SysPublicClass

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    static SysPublicClass *shareInstance = nil;
    dispatch_once(&onceToken, ^{
        shareInstance = [[[self class] alloc]init];
    });
    return shareInstance;
}

//验证邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//验证手机号
- (BOOL)validateMobile:(NSString *)mobileNum
{
    NSLog(@"mobileNum = %@",mobileNum);
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[0-9])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
//判断电话号码 (暂时没用到)
+ (BOOL)isMobileNumber:(NSString *)number
{
    NSString *pattern = @"^((13)|(15)|(17)|(18))\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:number];
}
////验证用户名是否有效
+ (BOOL)isValidateUserName:(NSString*)userName
{
    NSString *userRegex = @"^[a-zA-Z]\\w{5,15}$";
    NSPredicate *userTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userRegex];
    return [userTest evaluateWithObject:userName];
}
//验证密码是否有效
+ (BOOL)isValidatePassWord:(NSString*)passWord
{
    NSString *userRegex = @"^\\w{6,16}$";
    NSPredicate *userTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userRegex];
    return [userTest evaluateWithObject:passWord];
}
+ (void)showAlerttViewWithText:(NSString*)text sureBlock:(SureAlertAction)sureBlock
{
    [[SysAlertTool shareAlert] showAlertViewWithMessage:text confirm:CONFIRM cancle:CANCLE alertBlock:^(UIAlertView *alertView, NSInteger btnIndex) {
        if (sureBlock) {
            if (btnIndex == 0) {
                sureBlock(btnIndex);
            }
        }else{
            
        }
    }];
}

@end


