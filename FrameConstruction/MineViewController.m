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
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(0, 0, 100, 30);
    
    [btn setTitle:@"自定义titile" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(changeTitle:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.backgroundColor = [UIColor blackColor];
    
    self.navigationItem.titleView = btn;


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
    
    [[PopupHelper sharePopupHelper] showPopupWithTitle:@"新标题" message:@"请输入新标题" popupStyle:TextField_PopupStyle viewController:self clickSure:^(id result) {
        
        NSString *newTitle = [NSString stringWithFormat:@"%@", result];
        
        if (newTitle.length > 0 ) {
            
            [sender setTitle:newTitle forState:UIControlStateNormal];
            
        }

    } clickCancel:^{
        
    }];


}


@end
