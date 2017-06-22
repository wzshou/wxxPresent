//
//  C_ViewController.m
//  wxxPresent
//
//  Created by Wzs 王 on 2017/6/22.
//  Copyright © 2017年 1224708605@qq.com. All rights reserved.
//

#import "C_ViewController.h"

@interface C_ViewController ()

@end

@implementation C_ViewController
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)sureBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.view.superview.transform = CGAffineTransformMakeTranslation(0,  40 );
    
}


@end
