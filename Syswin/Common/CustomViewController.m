//
//  CustomViewController.m
//  Syswin
//
//  Created by wangpeirong on 15/5/28.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

@synthesize m_viewNaviBar = _viewNaviBar;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.wantsFullScreenLayout = YES;
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    //    UITableView
    self.wantsFullScreenLayout = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;//将自带的隐藏了;
    
    //改变电池栏文字颜色
    if (IsIOS7) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kBackGroundColor;
    
    self.m_viewNaviBar = [[CustomNaviBarView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [CustomNaviBarView barSize].width, [CustomNaviBarView barSize].height)];
    //    if (!IsIOS7) {
    //        if (!isPad_SC) {
    //            CGRect rect = self.m_viewNaviBar.frame;
    //            rect.origin.y -= 20;
    //            self.m_viewNaviBar.frame = rect;
    //        }
    
    //    }
    //    _viewNaviBar.m_viewCtrlParent = self;
    [self.view addSubview:_viewNaviBar];
    
    
    [self setNaviLeftBarStyle:kBarStyleNone];
    
}
- (void)setNaviLeftTitle:(NSString *)leftTitle
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 23, 23);
    [backButton setTitle:leftTitle forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    backButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    if (!isPad_SC) {
        backButton.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 26);
        backButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 4);
    }
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_viewNaviBar setLeftBtn:backButton];
    
}
- (void)setNaviLeftBarStyle:(kBarStyle)style
{
    if (style == kBarStyleBack) {
        [self setNaviLeftTitle:@"返回"];
    }else if (style == kBarStyleHomeIcon){
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0, 23, 23);
        [backButton setImage:[UIImage imageNamed:@"home_icon"] forState:UIControlStateNormal];
        backButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        backButton.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        if (!isPad_SC) {
            backButton.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 26);
        }
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [_viewNaviBar setLeftBtn:backButton];
    }else if (style == kBarStyleNone){
        
        UIButton *noneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        noneButton.frame = CGRectMake(0, 0, 0, 0);
        [_viewNaviBar setLeftBtn:noneButton];
    }
}
- (void)setLeftBarStyleBackWithTarget:(id)target action:(SEL)action
{
    //设置导航栏系统样式
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 60, 50);
    backButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    backButton.imageEdgeInsets = UIEdgeInsetsMake(10, 21.5, 10, 21.5);
    if (!isPad_SC) {
        backButton.imageEdgeInsets = UIEdgeInsetsMake(10, 9.5, 10, 33.5);
    }
    [backButton setImage:[UIImage imageNamed:@"backArrow"] forState:UIControlStateNormal];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [_viewNaviBar setLeftBtn:backButton];
}
- (void)setNaviLeftBarBackActionCustomWithTarget:(id)target action:(SEL)action barStyle:(kBarStyle)style
{
    [self setLeftBarStyleBackWithTarget:target action:action];
}
- (void)setRightBarTitle:(NSString *)title
{
    [_viewNaviBar setRightTitle:title];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc
{
    [UtilityFunc cancelPerformRequestAndNotification:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_viewNaviBar && !_viewNaviBar.hidden)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{}
}

#pragma mark -

- (void)bringNaviBarToTopmost
{
    if (_viewNaviBar)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{}
}

- (void)hideNaviBar:(BOOL)bIsHide
{
    _viewNaviBar.hidden = bIsHide;
}

- (void)setNaviBarTitle:(NSString *)strTitle
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setTitle:strTitle];
    }else{APP_ASSERT_STOP}
}

- (void)setNaviBarLeftBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setLeftBtn:btn];
    }else{APP_ASSERT_STOP}
}

- (void)setNaviBarRightBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightBtn:btn];
    }else{APP_ASSERT_STOP}
}

- (void)naviBarAddCoverView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverView:view animation:YES];
    }else{}
}

- (void)naviBarAddCoverViewOnTitleView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverViewOnTitleView:view];
    }else{}
}

- (void)naviBarRemoveCoverView:(UIView *)view
{
    if (_viewNaviBar)
    {
        [_viewNaviBar hideCoverView:view];
    }else{}
}

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack
{
    if (self.navigationController)
    {
    }else{}
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
