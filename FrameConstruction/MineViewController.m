//
//  MineViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/28.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "MineViewController.h"
#import "MineSecondViewController.h"

#import "ImageDownloadViewController.h"

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableV;

@property (nonatomic, strong) NSArray *functionArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];

    self.navigationItem.title = @"我的";
    
    self.functionArray = @[@"我的二级界面",@"图片下载",@"视频下载",@"多文件下载"];
    
    UIButton *btn = [UIButton buttonWithFrame:CGRectMake(0, 0, 100, 30) backgroundColor:[UIColor blackColor] title:@"点击更改标题" titleColor:[UIColor whiteColor] highlightedColor:[UIColor lightGrayColor] target:self selector:@selector(changeTitle:)];
    
    [btn setBorderStyleBorderWidth:1 borderColor:[UIColor whiteColor] cornerRadius:5];
    
    self.navigationItem.titleView = btn;

    self.tableV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableV.delegate = self;
    
    self.tableV.dataSource = self;
    
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
   
    if (!cell) {
    
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];

    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
 
    cell.textLabel.text = self.functionArray[indexPath.row];
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.functionArray.count;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            MineSecondViewController *detailVC = [[MineSecondViewController alloc] init];
            
            self.hidesBottomBarWhenPushed = YES;
            
            [self.navigationController pushViewController:detailVC animated:YES];
            
            self.hidesBottomBarWhenPushed = NO;

        }
            break;
            
        case 1:
        {
            ImageDownloadViewController *detailVC = [[ImageDownloadViewController alloc] init];

            self.hidesBottomBarWhenPushed = YES;
            
            [self.navigationController pushViewController:detailVC animated:YES];
            
            self.hidesBottomBarWhenPushed = NO;
            
        }
            break;
            
        default:
            break;
    }
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self deselect];
    
}

#pragma mark - 取消 cell 的选中效果

- (void)deselect {
    
    //取消 cell 的选中效果
    [self.tableV deselectRowAtIndexPath:[self.tableV indexPathForSelectedRow] animated:YES];

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
