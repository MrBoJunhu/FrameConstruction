//
//  MineSecondViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "MineSecondViewController.h"

#import "MineDetailViewController.h"

@interface MineSecondViewController ()

@property (nonatomic, strong) UITableView *tableV;

@end

@implementation MineSecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.title = @"我的二级界面";
    
    self.hidesBottomBarWhenPushed = YES;

    [self setRightNavigationItem];
    
    self.tableV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableV];

}

- (void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
    self.tableV.frame = self.view.bounds;
}

- (void)clickRightItem{
    
    MineDetailViewController *mineDVC = [[MineDetailViewController alloc] init];
    
    [self.navigationController pushViewController:mineDVC animated:YES];
    
}


@end
