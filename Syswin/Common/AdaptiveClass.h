//
//  AdaptiveClass.h
//  Syswin
//
//  Created by wangpeirong on 15/5/29.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface AdaptiveClass : NSObject

//NSString* URLWithPath(NSString *Path)
//{
//    return [NSString stringWithFormat:@"%@%@%@", @"aaa", Path ,@"bbb"];
//}

CG_INLINE CGRect

CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    CGRect rect;
    rect.origin.x = x * myDelegate.autoSizeScaleX;
    rect.origin.y = y * myDelegate.autoSizeScaleY;
    
    rect.size.width  = width  * myDelegate.autoSizeScaleX;
    rect.size.height = height * myDelegate.autoSizeScaleY;
    
    return rect;
}


@end
