//
//  PhoneTextView.m
//  Syswin
//
//  Created by wangpeirong on 15/5/29.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

#import "PhoneTextView.h"


@implementation PhoneTextView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 3.0;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 0.5;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake1(0, 0 , 50, 30)];
        label.backgroundColor = [UIColor clearColor];
        label.text = @"+86";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:18];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
        UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake1(label.frame.origin.x + label.frame.size.width, 0, 0.5, 30)];
        lineLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:lineLabel];
        
    }
    return self;
}


@end
