//
//  wxxPresent_H.h
//  各种动画效果
//
//  Created by Wzs 王 on 2017/6/6.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#ifndef wxxPresent_H_h
#define wxxPresent_H_h


#endif /* wxxPresent_H_h */


#define dimViewTag                          423234

typedef NS_ENUM(NSInteger, wxxPresentAnimationStly) {
    wxxPresentAnimationStly_default =0,//原有的系统动画
    wxxPresentAnimationStly_Flashing = 1,//闪动
        wxxPresentAnimationStly_ShakeDown = 2,//从上往下摇晃,
    wxxPresentAnimationStly_upToDown = 3,
    wxxPresentAnimationStly_downToUp = 4,
    wxxPresentAnimationStly_ShakeUp = 5 , //摇晃着上去
    wxxPresentAnimationStly_shortToLong = 6,  //height从1到正常高度
    wxxPresentAnimationStly_gradually = 7  //逐渐出现
};

typedef void (^setAnimation)(UIView * _Nonnull toView,id <UIViewControllerContextTransitioning> _Nonnull transitionContext);
