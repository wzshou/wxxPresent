//
//  UIViewController+wxxPresent.m
//  各种动画效果
//
//  Created by Wzs 王 on 2017/6/6.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import "UIViewController+wxxPresent.h"

#import <objc/Object.h>

//#import "wxxPresentationController.h"
#import "wxxPresentVC_animation.h"
#import "wxxDismissVC_animation.h"

//static  wxxPresentVC_animation *wxxPresentVC;


@interface UIViewController ()

@property (nonatomic,strong)wxxPresentVC_animation *wxxPresent;
@property (nonatomic,strong)wxxDismissVC_animation *wxxDismiss;

@end




@implementation UIViewController (wxxPresent)


- (wxxDismissVC_animation *)wxxDismiss{

    return objc_getAssociatedObject(self, @selector(wxxDismiss));
    
}

- (void)setWxxDismiss:(wxxDismissVC_animation *)wxxDismiss{
    
    objc_setAssociatedObject(self, @selector(wxxDismiss), wxxDismiss, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (wxxPresentVC_animation *)wxxPresent{
    return objc_getAssociatedObject(self, @selector(wxxPresent));
    
}

- (void)setWxxPresent:(wxxPresentVC_animation *)wxxPresent{
    
    objc_setAssociatedObject(self, @selector(wxxPresent), wxxPresent, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}




-(void)wxxPrenstToVC:(UIViewController *_Nullable)vc prenstAnimation:(setAnimation _Nullable )prensAnimation dissmissAnimation:(setAnimation _Nullable )dissmissAnimation completion:(void (^ __nullable)(void))completion{
    
    
    if (self.wxxPresent == nil) {
        self.wxxPresent =  [[wxxPresentVC_animation alloc]init];
    }
    if (self.wxxDismiss == nil) {
        self.wxxDismiss =  [[wxxDismissVC_animation alloc]init];
    }
    
    
    self.wxxPresent.customAnimation = prensAnimation;
    self.wxxDismiss.customAnimation = dissmissAnimation;
    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:completion];

}


-(void)wxxPrenstToVC:(UIViewController *)vc animationStly:(wxxPresentAnimationStly)animationStly  completion:(void (^ __nullable)(void))completion{

    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    
    if (self.wxxPresent == nil) {
        self.wxxPresent =  [[wxxPresentVC_animation alloc]init];
    }
    if (self.wxxDismiss == nil) {
        self.wxxDismiss =  [[wxxDismissVC_animation alloc]init];
    }

    
    self.wxxPresent.presentAnimationStly = animationStly;
    self.wxxDismiss.presentAnimationStly = animationStly;

    [self presentViewController:vc animated:YES completion:completion];
}

//- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
//{
//    return [[wxxPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
//}
#pragma mark---- present的时候调用 ----
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    if (self.wxxPresent.presentAnimationStly == 0 && self.wxxPresent.customAnimation == nil) {
        return nil;
    }
    
    return self.wxxPresent;
}
#pragma mark---- dissMiss 的时候调用 ----
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    
    if (self.wxxDismiss.presentAnimationStly == 0 && self.wxxDismiss.customAnimation == nil) {
        return nil;
    }

    return self.wxxDismiss;;
}


@end
