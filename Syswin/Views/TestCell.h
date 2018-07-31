//
//  TestCell.h
//  Syswin
//
//  Created by 王培荣 on 2018/7/15.
//  Copyright © 2018年 wangpeirong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TestCellDelegate <NSObject>

//代理方法
- (void)callBackMethod:(NSString *)str;

@end

@interface TestCell : UITableViewCell

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *subTitle;
@property (nonatomic,assign) id <TestCellDelegate> delegate;


@end
