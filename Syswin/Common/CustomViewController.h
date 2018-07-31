//
//  CustomViewController.h
//  Syswin
//
//  Created by wangpeirong on 15/5/28.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNaviBarView.h"

typedef enum NaviBarStyle{
    kBarStyleBack,
    kBarStyleHomeIcon,
    kBarStyleNone
}kBarStyle;

@interface CustomViewController : UIViewController

@property (nonatomic,strong) CustomNaviBarView *m_viewNaviBar;

- (void)bringNaviBarToTopmost;

- (void)hideNaviBar:(BOOL)bIsHide;
- (void)setNaviBarTitle:(NSString *)strTitle;
- (void)setNaviBarLeftBtn:(UIButton *)btn;
- (void)setNaviBarRightBtn:(UIButton *)btn;
- (void)setNaviLeftTitle:(NSString *)leftTitle;

- (void)naviBarAddCoverView:(UIView *)view;
- (void)naviBarAddCoverViewOnTitleView:(UIView *)view;
- (void)naviBarRemoveCoverView:(UIView *)view;

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack;
- (void)setNaviLeftBarStyle:(kBarStyle)style;
- (void)setRightBarTitle:(NSString *)title;
- (void)setNaviLeftBarBackActionCustomWithTarget:(id)target action:(SEL)action barStyle:(kBarStyle)style;

@end
