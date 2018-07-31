//
//  TestCell.m
//  Syswin
//
//  Created by 王培荣 on 2018/7/15.
//  Copyright © 2018年 wangpeirong. All rights reserved.
//

#import "TestCell.h"

@interface TestCell ()

@property (nonatomic,strong) UILabel     *titleLable;
@property (nonatomic,strong) UILabel     *subTitleLable;
@property (nonatomic,strong) UIButton    *tapButton;

@end

@implementation TestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self addSubview:self.titleLable];
        [self addSubview:self.subTitleLable];
        [self addSubview:self.tapButton];
        
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    self.titleLable.text = title;
}

-(void)setSubTitle:(NSString *)subTitle
{
    self.subTitleLable.text = subTitle;
}

- (UILabel *)titleLable
{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        _titleLable.backgroundColor = [UIColor redColor];
        _titleLable.text = @"啦啦啦";
        _titleLable.font = [UIFont systemFontOfSize:15];
        
    }
    return _titleLable;
}

- (UILabel *)subTitleLable
{
    if (_subTitleLable == nil) {
        _subTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 25, 100, 10)];
        _subTitleLable.text = @"今天遇到个骗子";
        _subTitleLable.backgroundColor = [UIColor grayColor];
        _subTitleLable.font = [UIFont systemFontOfSize:9];
    }
    return _subTitleLable;
}

- (UIButton *)tapButton
{
    if (!_tapButton) {
        _tapButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tapButton setFrame:CGRectMake(200, 10, 100, 30)];
        [_tapButton setTitle:@"点击" forState:UIControlStateNormal];
        _tapButton.backgroundColor = [UIColor greenColor];
        [_tapButton addTarget:self action:@selector(buttonCLick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapButton;
}

- (void)buttonCLick:(UIButton *)btn
{
    
    if ([self.delegate respondsToSelector:@selector(callBackMethod:)]) {
        [self.delegate callBackMethod:@"代理方法返回的数据"];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
