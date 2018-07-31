//
//  MainViewController.m
//  Syswin
//
//  Created by wangpeirong on 15/6/1.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

#import "MainViewController.h"
#import "MobClick.h"
#import "FXLabel.h"

@interface MainViewController ()

@end

@implementation MainViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //友盟统计
    [MobClick beginLogPageView:@"MainViewController"];

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"MainViewController"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNaviLeftTitle:@"返回"];
    [self setNaviBarTitle:@"主页"];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView *imageView = [[UIView alloc]initWithFrame:CGRectMake1(20, UPHEIGHT + 20, ScreenWidth - 40, 200)];
    [imageView setBackgroundColor:[UIColor blackColor]];
    imageView.layer.cornerRadius = 5.0;
    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView.layer.borderWidth = 1.0;
    [self.view addSubview:imageView];
    
    FXLabel *label = [[FXLabel alloc]initWithFrame:CGRectMake1(10, 10, imageView.frame.size.width-20, 180)];
    label.text = @"最是哪一低头的温柔,恰是水莲花不胜凉风的娇羞.";

    label.gradientStartPoint = CGPointMake(0.0f, 0.0f);
    label.gradientEndPoint = CGPointMake(1.0f, 1.0f);
    label.gradientColors = @[[UIColor redColor],
                                   [UIColor yellowColor],
                                   [UIColor cyanColor],
                                   [UIColor greenColor],
                                   [UIColor yellowColor],
                                   [UIColor purpleColor],
                                   [UIColor redColor],
                                   [UIColor whiteColor]];
    label.numberOfLines = 2;


    [imageView addSubview:label];
    
        
    
}
@end
