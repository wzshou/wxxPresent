//
//  wxxPresentVC_animation.m
//  各种动画效果
//
//  Created by Wzs 王 on 2017/6/6.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import "wxxPresentVC_animation.h"
#import "wxxPresent_H.h"


#define SCRE_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCRE_HEIGHT [UIScreen mainScreen].bounds.size.height

#define WXX_transitionDefaultTime 0.4
//
//int WXX_transitionDuration = WXX_transitionDefaultTime;

@interface wxxPresentVC_animation ()

@property (nonatomic, strong) UIDynamicAnimator *animatior;

//@property (nonatomic, weak)UIViewController* toVc;


@end

@implementation wxxPresentVC_animation


//指明动画将执行多长时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return WXX_transitionDefaultTime;
}

//指明从A切入到B的过程中将执行的方法。
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    
//    fromView.userInteractionEnabled = self.canFromViewTouch;

    UIView *dimmingView = [[UIView alloc] initWithFrame:fromView.bounds];
    dimmingView.backgroundColor = [UIColor blackColor];
    dimmingView.layer.opacity = 0.4f;
    dimmingView.tag=dimViewTag;
    [transitionContext.containerView addSubview:dimmingView];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickDimmingView)];
//    [dimmingView addGestureRecognizer:tap];
    
    
    //toViewController:即B视图控制器
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //toView:B视图控制器的view
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //containView:可以理解为它管理着所有做转场动画的视图，必须将toView加入到其中
    UIView *containView = [transitionContext containerView];
    
    if (containView != nil && toView != nil && toViewController != nil) {
        
        toView.frame = [transitionContext finalFrameForViewController:toViewController];
        //将toView加入到其中
        [containView addSubview:toView];
        //contentView:示例中的弹框，因为我只需对弹框做动画
//        UIView *contentView = [toView viewWithTag:1000];
//        UIView *animatoinView = contentView;

        UIView *animatoinView = toView;
        //以下是keyframe动画
        
        //如果是自定义动画
        if (self.customAnimation) {
            
            self.customAnimation(animatoinView, transitionContext);
            
            self.customAnimation = nil;
            
        }else{
            
            switch (self.presentAnimationStly) {
                case 1:
                {
                    [self FlashingWithAnimatoinView:animatoinView transitionContext:transitionContext];
                }
                    break;
                    
                case 2:
                {
                    [self ShakeDownWithAnimatoinView:animatoinView transitionContext:transitionContext];
                }
                    break;
                    
                case 3:
                {
                    //                WXX_transitionDuration = 1.0;
                    
                    [self upToDownWithAnimatoinView:animatoinView transitionContext:transitionContext];
                }
                    break;
                    
                case 4:
                {
                    //                WXX_transitionDuration = 1.0;
                    
                    [self downToUpWithAnimatoinView:animatoinView transitionContext:transitionContext];
                }
                    break;
                    
                    
                case 5:
                {
                    [self ShakeUpWithAnimatoinView:animatoinView transitionContext:transitionContext];
                }
                    break;
                    
                case wxxPresentAnimationStly_shortToLong:
                {
                    [self shortToLongWithAnimatoinView:animatoinView transitionContext:transitionContext];

                }
                    break;
                    
                case 7:{
                    
                    [self graduallyWithAnimatoinView:animatoinView transitionContext:transitionContext   ];
                }
                    break;
                    
                default: [self FlashingWithAnimatoinView:animatoinView transitionContext:transitionContext];
                    
                    break;
            }

            
        }
        
    }
}

//#pragma mark---- 点击蒙版 ----
//- (void)clickDimmingView{
//    [self.toVc dismissViewControllerAnimated:YES completion:nil];
//}


#pragma mark---- 闪动 ----
- (void)FlashingWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    animatoinView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.334 animations:^{
            animatoinView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.334 relativeDuration:0.333 animations:^{
            animatoinView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.667 relativeDuration:0.333 animations:^{
            animatoinView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
        
    } completion:^(BOOL finished) {
        //报告动画完成
        [transitionContext completeTransition:finished];
        
    }];
    
    

}

#pragma mark---- 摇晃着下来 ----
- (void)ShakeDownWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    CGPoint center = animatoinView.center;
    
    
    animatoinView.center = CGPointMake(center.x , center.y /2);
    
    
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:animatoinView snapToPoint:center];
    snapBehavior.damping = 0.2;
    
    self.animatior = [[UIDynamicAnimator alloc] initWithReferenceView:animatoinView.superview];
    [self.animatior addBehavior:snapBehavior];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(WXX_transitionDefaultTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //报告动画完成
        [transitionContext completeTransition:YES];
        
    });
    
}


#pragma mark---- 摇晃着 上去----
- (void)ShakeUpWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    CGPoint center = animatoinView.center;
    
    
    animatoinView.center = CGPointMake(center.x , center.y *2);
    
    
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:animatoinView snapToPoint:center];
    snapBehavior.damping = 0.5;
    
    self.animatior = [[UIDynamicAnimator alloc] initWithReferenceView:animatoinView.superview];
    [self.animatior addBehavior:snapBehavior];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(WXX_transitionDefaultTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //报告动画完成
        [transitionContext completeTransition:YES];
        
    });
    
}

#pragma mark---- 上到下 ----
- (void)upToDownWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    CGPoint center = animatoinView.center;
    
    animatoinView.center = CGPointMake(center.x , 0);
    
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
        
        animatoinView.center = center;
        
    } completion:^(BOOL finished) {
        //报告动画完成
        [transitionContext completeTransition:finished];
//        WXX_transitionDuration = 0.4;

    }];
    
//    [UIView animateWithDuration:WXX_transitionDuration animations:^{
//        animatoinView.center = center;
//
//    } completion:^(BOOL finished) {
//        //报告动画完成
//        [transitionContext completeTransition:finished];
//
//    }];
    
}

#pragma mark---- 下到上 ----
- (void)downToUpWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    CGPoint center = animatoinView.center;
    
    animatoinView.center = CGPointMake(center.x , 2 * center.y);
    
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        animatoinView.center = center;
        
    } completion:^(BOOL finished) {
        //报告动画完成
        [transitionContext completeTransition:finished];
        //        WXX_transitionDuration = 0.4;
        
    }];
    
}

#pragma mark---- 高度从短到长 ----
- (void)shortToLongWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    animatoinView.transform = CGAffineTransformMakeScale(1.0, 0.1);
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        animatoinView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                
    } completion:^(BOOL finished) {
        //报告动画完成
        [transitionContext completeTransition:finished];
        
    }];
}


#pragma mark---- 逐渐出现 ----
- (void)graduallyWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    animatoinView.alpha = 0;
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        animatoinView.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        //报告动画完成
        [transitionContext completeTransition:finished];
        
    }];
}











@end
