//
//  B_ViewController.m
//  各种动画效果
//
//  Created by Wzs 王 on 2017/6/6.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import "B_ViewController.h"

//#import "wxxPresentationController.h"
//#import "wxxPresentVC_animation.h"
//#import "wxxDismissVC_animation.h"

@interface B_ViewController ()
////<UIViewControllerTransitioningDelegate>

@end

@implementation B_ViewController


- (instancetype)init{
  self =  [super init];
    
    if (self) {
        
//        self.modalPresentationStyle = UIModalPresentationCustom;
//        self.transitioningDelegate = self;
    }
    
    return self;
}
- (IBAction)clickCancel:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickSure:(UIButton *)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];


}
//- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
//{
//    return [[wxxPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
//}
//#pragma mark---- present的时候调用 ----
//- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
//{
//    return [[wxxPresentVC_animation alloc]init];
//}
//#pragma mark---- dissMiss 的时候调用 ----
//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
//{
//    return [[wxxDismissVC_animation alloc]init];
//}


@end
