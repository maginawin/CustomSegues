//
//  FirstCustomSegue.m
//  CustomSegues
//
//  Created by maginawin on 15-1-28.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "FirstCustomSegue.h"

@implementation FirstCustomSegue

- (void)perform {
    UIView* firstView = [self.sourceViewController view]; // 源视图
    UIView* secondView = [self.destinationViewController view]; // 目标视图
    
    // Get the screen width and height
    NSInteger screenWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    // Specify (指定) the initial (最初的) position of the destination view
    secondView.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight);
    
    // 这时第二个视图控制器还不是窗口的子视图, 在动画之前, 把它加到窗口上, 通过窗口对象的 insertSubview(view:aboveSubview:) 来实现
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:secondView aboveSubview:firstView];
    
    // 给转换过程添加动画
    [UIView animateWithDuration:0.4 animations:^ {
        firstView.frame = CGRectOffset(firstView.frame, 0.0, -screenHeight);
        secondView.frame = CGRectOffset(secondView.frame, 0.0, -screenHeight);
    } completion:^(BOOL finished) {
        [self.sourceViewController presentViewController:self.destinationViewController animated:false completion:nil];
    }];
}

@end
