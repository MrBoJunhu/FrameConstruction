//
//  FindViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "FindViewController.h"

#import "FindDetailViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.title = @"发现";
    
    [self setRightNavigationItem];
    
    [self setLeftNavigationItem];
    
}

- (void)clickLeftItem{
    
    //优先选择
    [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];

}


- (void)clickRightItem {
    
    FindDetailViewController *detail = [[FindDetailViewController alloc] init];
  
    self.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detail animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;
    
}


@end
