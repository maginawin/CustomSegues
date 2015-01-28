//
//  FirstCustomSegueUnwind.m
//  CustomSegues
//
//  Created by maginawin on 15-1-28.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "FirstCustomSegueUnwind.h"

@implementation FirstCustomSegueUnwind

- (void)perform {
    UIView* secondView = [self.sourceViewController view];
    UIView* firstView = [self.destinationViewController view];
    NSInteger screenWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger screenHeight = [UIScreen mainScreen].bounds.size.height;
    firstView.frame = CGRectMake(0, -screenHeight, screenWidth, screenHeight);
    UIColor* tempColor = firstView.backgroundColor;
    firstView.backgroundColor = [UIColor redColor];
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:firstView aboveSubview:secondView];
    
    // Animate the transition
    [UIView animateWithDuration:0.4 animations:^ {
        firstView.frame = CGRectOffset(firstView.frame, 0.0, screenHeight);
        secondView.frame = CGRectOffset(secondView.frame, 0.0, screenHeight);
    } completion:^(BOOL finished) {
//        [self.sourceViewController dismissViewControllerAnimated:NO completion:nil];
        [self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:^ {
            [UIView animateWithDuration:0.8 animations:^ {
                firstView.backgroundColor = tempColor;
            }];
        }];
    }];
}

@end
