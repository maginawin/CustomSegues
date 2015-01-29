//
//  ThirdViewController.m
//  CustomSegues
//
//  Created by maginawin on 15-1-28.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer* gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(backToA)];
    gesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:gesture];
}

- (void)backToA {
    [self performSegueWithIdentifier:@"idSecondSegueUnwind" sender:self];
}

@end
