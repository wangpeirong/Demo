//
//  AppDelegate.h
//  Syswin
//
//  Created by wangpeirong on 15/5/28.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (assign, nonatomic)float autoSizeScaleX;
@property (assign, nonatomic)float autoSizeScaleY;
@property (nonatomic,strong)UINavigationController *navigation;


@end

