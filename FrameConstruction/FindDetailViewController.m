//
//  FindDetailViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "FindDetailViewController.h"

@interface FindDetailViewController ()

@end

@implementation FindDetailViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.title = @"发现详情页";
    
    [self setLeftNavigationItem];

}

- (void)clickLeftItem{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
