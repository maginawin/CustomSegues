//
//  ViewController.m
//  CustomSegues
//
//  Created by maginawin on 15-1-28.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "ViewController.h"
#import "FirstCustomSegueUnwind.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加手势
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showSecondViewController)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeGestureRecognizer];
}

- (void)showSecondViewController {
    [self performSegueWithIdentifier:@"idFirstSegue" sender:self];    
}

// 准备跳 segue 前调用, 一般用来传递数据
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"idFirstSegue"]) {
        SecondViewController* vc = segue.destinationViewController;
        vc.message = @"Hello from the 1st View Controller";
    }
}

// 解除转场执行时自动调用
- (UIStoryboardSegue*)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"idFirstSegueUnwindow"]) {
        FirstCustomSegueUnwind* unwindSegue = [FirstCustomSegueUnwind segueWithIdentifier:@"idFirstSegueUnwindow" source:fromViewController destination:toViewController performHandler:^ {}];
        return unwindSegue;
    }
    return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
}

// 需要 Exit 到此界面时, 连接的方法
- (IBAction)backToA:(UIStoryboardSegue*)sender {
    UIColor* originalColor = self.view.backgroundColor; // original 原始; 原始的
    self.view.backgroundColor = [UIColor redColor];
    [UIView animateWithDuration:1.0 animations:^ {
        self.view.backgroundColor = originalColor;
    }];
}

@end
