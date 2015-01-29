//
//  SecondViewController.m
//  CustomSegues
//
//  Created by maginawin on 15-1-28.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstCustomSegueUnwind.h"
#import "ViewController.h"

@interface SecondViewController ()

@property (nonatomic, weak) IBOutlet UILabel* msgLabel;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加手势
    UISwipeGestureRecognizer* swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showFirstViewController)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeGestureRecognizer];
}

- (void)viewWillAppear:(BOOL)animated {
    _msgLabel.text = _message;
}

#pragma mark - Selector

- (void)showFirstViewController {
    [self performSegueWithIdentifier:@"idFirstSegueUnwind" sender:self];
//    [self dismissViewControllerAnimated:YES completion:^ {}];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"idFirstSegueUnwind"]) {
        ViewController* vc = segue.destinationViewController;
        vc.msgLabel.text = @"You just came back from the 2nd VC";
    }
}

@end
