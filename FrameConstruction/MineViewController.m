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

@property (nonatomic, strong) UITableView *tableV;

@end

@implementation MineViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];

    self.navigationItem.title = @"我的";
        
    [self setRightNavigationItem];
    
    //http://www.cartier.cn/content/dam/rcq/car/14/37/90/9/1437909.png
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(0, 0, 100, 30);
    
    [btn setTitle:@"自定义titile" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(changeTitle:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.backgroundColor = [UIColor blackColor];
    
    self.navigationItem.titleView = btn;

    self.tableV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableV];
    
}

- (void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
    self.tableV.frame = self.view.bounds;
    
    self.tableV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
   
    [self setBradgeNumberAtIndex:0 bradgeNumber:3];

}


- (void)clickRightItem {
    
    MineSecondViewController *detailVC = [[MineSecondViewController alloc] init];
   
    self.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;

}

#pragma mark - 自带输入框的弹窗

- (void)changeTitle:(UIButton *)sender {
    
    [[PopupHelper sharePopupHelper] showPopupWithTitle:@"新标题" message:@"请输入新标题"  sureButtonTitle:nil cancelTitle:nil popupStyle:TextField_PopupStyle viewController:self clickSure:^(id result) {
        
        NSString *newTitle = [NSString stringWithFormat:@"%@", result];
        
        if (newTitle.length > 0 ) {
            
            [sender setTitle:newTitle forState:UIControlStateNormal];
            
        }

    } clickCancel:^{
        
    }];


}


@end
