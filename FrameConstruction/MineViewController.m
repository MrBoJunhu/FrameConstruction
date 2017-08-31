//
//  MineViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/28.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "MineViewController.h"
#import "MineSecondViewController.h"
@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];

    self.navigationItem.title = @"我的";
        
    [self setRightNavigationItem];

}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}


- (void)clickRightItem {
    
    MineSecondViewController *detailVC = [[MineSecondViewController alloc] init];
   
    self.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;

}



@end
