//
//  BasicViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/28.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
  
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setRightNavigationItem];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
}

@end
