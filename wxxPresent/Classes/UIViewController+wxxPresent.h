//
//  UIViewController+wxxPresent.h
//  各种动画效果
//
//  Created by Wzs 王 on 2017/6/6.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wxxPresent_H.h"



@interface UIViewController (wxxPresent)<UIViewControllerTransitioningDelegate>



-(void)wxxPrenstToVC:(UIViewController *_Nullable)vc animationStly:(wxxPresentAnimationStly)animationStly completion:(void (^ __nullable)(void))completion;


-(void)wxxPrenstToVC:(UIViewController *_Nullable)vc prenstAnimation:(setAnimation _Nullable )prensAnimation dissmissAnimation:(setAnimation _Nullable )dissmissAnimation completion:(void (^ __nullable)(void))completion;





@end
