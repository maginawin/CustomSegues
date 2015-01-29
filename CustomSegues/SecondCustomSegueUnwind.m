//
//  SecondCustomSegueUnwind.m
//  CustomSegues
//
//  Created by maginawin on 15-1-28.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "SecondCustomSegueUnwind.h"

@implementation SecondCustomSegueUnwind

- (void)perform { // perform 执行, 完成; 演奏; 表演
    UIView* firstView = [self.destinationViewController view];
    UIView* thirdView = [self.sourceViewController view];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    firstView.frame = CGRectOffset(firstView.frame, 0.0, height);
    firstView.transform = CGAffineTransformScale(firstView.transform, 0.001, 0.001);
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:firstView aboveSubview:thirdView];
    
    [UIView animateWithDuration:0.5 animations:^ {
        thirdView.transform = CGAffineTransformScale(thirdView.transform, 0.001, 0.001);
        thirdView.frame = CGRectOffset(thirdView.frame, 0.0, -height);        
        firstView.transform = CGAffineTransformIdentity;
        firstView.frame = CGRectOffset(firstView.frame, 0.0, -height);
    } completion:^(BOOL finished) {
        [self.sourceViewController dismissViewControllerAnimated:NO completion:nil];
    }];
}

@end
