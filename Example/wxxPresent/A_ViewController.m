//
//  A_ViewController.m
//  各种动画效果
//
//  Created by Wzs 王 on 2017/6/6.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import "A_ViewController.h"
#import "B_ViewController.h"
#import "C_ViewController.h"
#import "UIViewController+wxxPresent.h"


@interface A_ViewController ()

@end

@implementation A_ViewController
- (IBAction)presentToB:(UIButton *)sender {
    
    B_ViewController *b = [B_ViewController new];
    
//    [self presentViewController:b animated:YES completion:^{
//        
//    }];
    
    [self wxxPrenstToVC:b animationStly:(wxxPresentAnimationStly_default) completion:^{
        
    }];
}
- (IBAction)munu:(id)sender {
    
    
    C_ViewController *C = [C_ViewController new];
    [self wxxPrenstToVC:C animationStly:(wxxPresentAnimationStly_gradually) completion:^{
        
    }];
    
}


- (IBAction)vvvvB:(id)sender {
    
    
    B_ViewController *b = [B_ViewController new];
    [self wxxPrenstToVC:b animationStly:(wxxPresentAnimationStly_ShakeDown) completion:^{
        
    }];
    
    
}
- (IBAction)vvvv3:(id)sender {
    
    
    B_ViewController *b = [B_ViewController new];
    [self wxxPrenstToVC:b animationStly:(wxxPresentAnimationStly_Flashing) completion:^{
        
    }];
    
    
}
- (IBAction)vvvv4:(id)sender {
    
    
    B_ViewController *b = [B_ViewController new];
    [self wxxPrenstToVC:b animationStly:(wxxPresentAnimationStly_upToDown) completion:^{
        
    }];
    
    
}
- (IBAction)vvvv5:(id)sender {
    
    
    B_ViewController *b = [B_ViewController new];
    [self wxxPrenstToVC:b animationStly:(wxxPresentAnimationStly_downToUp) completion:^{
        
    }];
    
    
}

- (IBAction)vvvv6:(id)sender {
    
    
    B_ViewController *b = [B_ViewController new];
    [self wxxPrenstToVC:b animationStly:(wxxPresentAnimationStly_ShakeUp) completion:^{
        
    }];
    
    
}
- (IBAction)setAnimation:(UIButton *)sender {
    
    B_ViewController *b = [B_ViewController new];
    
    __weak A_ViewController *weakSelf = self;
    [self wxxPrenstToVC:b prenstAnimation:^(UIView * _Nonnull toView, id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
        
        CGFloat time = 0.3;
        [toView.layer addAnimation:[weakSelf getrotationWithDuration:time] forKey:nil];
        
        CGRect frame = toView.frame;
        
        toView.frame = CGRectMake(300, 680, 50, 80);
        
        [UIView animateWithDuration:time animations:^{
            
            toView.frame = frame;
            
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
            [toView.layer removeAllAnimations];
        }];
        
        
        
        
        
    } dissmissAnimation:^(UIView * _Nonnull toView, id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
        
        CGFloat time = 0.3;
        [toView.layer addAnimation:[weakSelf getrotationWithDuration:time] forKey:nil];
        CGRect frame = toView.frame;

        toView.frame = CGRectMake(frame.origin.x + 200, frame.origin.y + 300, frame.size.width, frame.size.height);
        [UIView animateWithDuration:time animations:^{
            
            toView.frame = CGRectMake(400, 680, 50, 80);
            
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:YES];
            [toView.layer removeAllAnimations];

        }];
        
        
    } completion:^{
        
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



#pragma mark <动画效果>
//圈圈
- (CABasicAnimation *)getrotationWithDuration:(CGFloat)duration
{
    CABasicAnimation *cabanim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    cabanim.toValue = @(M_PI*2);
    cabanim.duration = duration;//速度
    cabanim.repeatCount = MAXFLOAT;
    
    return cabanim;
}





@end
