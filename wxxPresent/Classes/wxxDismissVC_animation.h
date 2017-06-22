//
//  wxxDissmissVC_animation.h
//  各种动画效果
//
//  Created by Wzs 王 on 2017/6/6.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "wxxPresentVC_animation.h"

@interface wxxDismissVC_animation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign)wxxPresentAnimationStly presentAnimationStly;

@property (nonatomic, copy)setAnimation customAnimation;


@end
