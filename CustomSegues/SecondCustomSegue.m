//
//  SecondCustomSegue.m
//  CustomSegues
//
//  Created by maginawin on 15-1-28.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "SecondCustomSegue.h"

@implementation SecondCustomSegue

- (void)perform {
    UIView* firstView = [self.sourceViewController view];
    UIView* thirdView = [self.destinationViewController view];
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:thirdView aboveSubview:firstView];
    // 缩小宽和高, 若设置为 0 则完全没效果了!
    thirdView.transform = CGAffineTransformScale(thirdView.transform, 0.001, 0.001);
    // 执行动画, 应用两个连续的动画, 1st: 缩小源视图, 2nd: 放大目标视图
    [UIView animateWithDuration:0.5 animations:^ {
        firstView.transform = CGAffineTransformScale(firstView.transform, 0.001, 0.001);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^ {
            thirdView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
//            firstView.transform = CGAffineTransformIdentity;
            [self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:nil];
        }];
    }];
}

@end
