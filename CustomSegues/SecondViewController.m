//
//  SecondViewController.m
//  CustomSegues
//
//  Created by maginawin on 15-1-28.
//  Copyright (c) 2015年 mycj.wwd. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstCustomSegueUnwind.h"

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

- (void)showFirstViewController {
    NSLog(@"down");
    [self performSegueWithIdentifier:@"idTest" sender:self];
//    [self dismissViewControllerAnimated:YES completion:^ {}];
}

//
//// 重载此方法, 此方法是 VC 提供的方法, 在解除转场执行的时候会自动调用这个方法, 实现是手动添加的
//- (UIStoryboardSegue*)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
//    NSLog(@"segue");
//    if ([identifier  isEqual: @"idTest"]) {
//        UIStoryboardSegue* unwindSegue = [FirstCustomSegueUnwind segueWithIdentifier:identifier source:fromViewController destination:toViewController performHandler:^ {}];
//        NSLog(@"here");
//        return unwindSegue;
//    }
//    NSLog(@"here2");
//    return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
//}
//
//// 从 VC 连接到 Exit 的方法, 参数是 UIStoryboardSegue
//- (IBAction)returnFromSegueAction:(UIStoryboardSegue*)sender {
//    if ([sender.identifier isEqualToString:@"idTest"]) {
//        UIColor* originalColor = [self.view backgroundColor];
//        self.view.backgroundColor = [UIColor redColor];
//        [UIView animateWithDuration:1.0 animations:^ {
//            self.view.backgroundColor = originalColor;
//        }];
//        NSLog(@"hehe");
//    }
//    NSLog(@"hehe");
//}
@end
