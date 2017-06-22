//
//  wxxDissmissVC_animation.m
//  各种动画效果
//
//  Created by Wzs 王 on 2017/6/6.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import "wxxDismissVC_animation.h"
#import "wxxPresent_H.h"

@implementation wxxDismissVC_animation


//指明动画将执行多长时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

//指明从A切入到B的过程中将执行的方法。
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //动画时间
    NSTimeInterval duration = [self transitionDuration:transitionContext];

    
    //1.对灰色的遮盖 view 做消失动画
    UIView *dimmingView  = [transitionContext.containerView viewWithTag:dimViewTag];
    
    [UIView animateWithDuration:duration animations:^{
        dimmingView.alpha = 0;
    } completion:^(BOOL finished) {
        [dimmingView removeFromSuperview];
        
    }];
    
    //2.
    //因为是dismiss的时候是从B切换到A，所以此时fromView是B的view
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    //如果是自定义动画
    if (self.customAnimation) {
        
        self.customAnimation(fromView, transitionContext);
        self.customAnimation = nil;

        return;
    }
    
    /*
     
     wxxPresentAnimationStly_default =0,//原有的系统动画
     wxxPresentAnimationStly_Flashing = 1,//闪动
     wxxPresentAnimationStly_ShakeDown = 2,//从上往下摇晃,
     wxxPresentAnimationStly_upToDown = 3,
     wxxPresentAnimationStly_downToUp = 4,
     wxxPresentAnimationStly_ShakeUp = 5  //摇晃着上去
     */
    
    

    
    switch (self.presentAnimationStly) {
        case 1:
        {
            [self FadeAwayWithAnimatoinView:fromView transitionContext:transitionContext];
        }
            break;
            
        case 2:
        {
            [self downToUpWithAnimatoinView:fromView transitionContext:transitionContext];
        }
            break;
            
        case 3:
        {
            [self downToUpWithAnimatoinView:fromView transitionContext:transitionContext];
        }
            break;
            
        case 4:
        {
            
            [self upToDownWithAnimatoinView:fromView transitionContext:transitionContext];
        }
            break;
            
        case 5:
        {
            [self upToDownWithAnimatoinView:fromView transitionContext:transitionContext];
        }
            break;
            
        case 6:{
            [self LongToShortWithAnimatoinView:fromView transitionContext:transitionContext];
        }
            break;
        case 7:{
            [self FadeAwayWithAnimatoinView:fromView transitionContext:transitionContext];
        }
            break;
            
           
        default: {
            [self FadeAwayWithAnimatoinView:fromView transitionContext:transitionContext];
        }
            
            break;
    }

    
    
}


#pragma mark---- 慢慢消失----
- (void)FadeAwayWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        animatoinView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:finished];
    }];

}

#pragma mark---- 上到下 ----
- (void)upToDownWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    CGPoint center = animatoinView.center;
    
    CGPoint endP = CGPointMake(center.x, center.y * 3);
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
        
        animatoinView.center = endP;
        
    } completion:^(BOOL finished) {
        //报告动画完成
        [transitionContext completeTransition:finished];
        
    }];
    
    
}

#pragma mark---- 下到上 ----
- (void)downToUpWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    CGPoint center = animatoinView.center;
    
    CGPoint endP = CGPointMake(center.x, -center.y );
    
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        animatoinView.center = endP;
        
    } completion:^(BOOL finished) {
        //报告动画完成
        [transitionContext completeTransition:finished];
        //        WXX_transitionDuration = 0.4;
        
    }];
    
}


#pragma mark---- 高度从长到短 ----
- (void)LongToShortWithAnimatoinView:(UIView *)animatoinView transitionContext:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
        
        [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
            
            animatoinView.transform = CGAffineTransformMakeScale(1.0, 0.1);
            
        } completion:^(BOOL finished) {
            //报告动画完成
            [transitionContext completeTransition:finished];
            
        }];
        
    
 
    
}







@end
