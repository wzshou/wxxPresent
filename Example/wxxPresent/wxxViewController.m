//
//  wxxViewController.m
//  wxxPresent
//
//  Created by 1224708605@qq.com on 06/22/2017.
//  Copyright (c) 2017 1224708605@qq.com. All rights reserved.
//

#import "wxxViewController.h"
#import "A_ViewController.h"
#import "UIViewController+wxxPresent.h"

@interface wxxViewController ()

@end

@implementation wxxViewController
- (IBAction)click:(UIButton *)sender {
    A_ViewController *a = [A_ViewController new];
    [self wxxPrenstToVC:a animationStly:(wxxPresentAnimationStly_Flashing) completion:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
