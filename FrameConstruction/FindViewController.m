//
//  FindViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "FindViewController.h"

#import "FindDetailViewController.h"


@interface FindViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate, UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) BOOL hasData;

@property (nonatomic, strong) UITableView *tbv;

@end

@implementation FindViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
        
}

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.title = @"发现";
    
    [self setRightNavigationItem];
    
    [self setLeftNavigationItem];
    
    _tbv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:_tbv];
    
    _tbv.delegate = self;
    
    _tbv.dataSource = self;
    
    _tbv.emptyDataSetSource = self;
    
    _tbv.emptyDataSetDelegate = self;
    
    _tbv.backgroundColor = [UIColor cyanColor];
    
    _tbv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)clickLeftItem{
    
    //优先选择
    [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];

}


- (void)getDataFromNetwork {
    
    NetworkRequest *request = [NetworkRequest requesForDynamicLoginaccid:@"0" pageIndex:@"1" pageSize:@"10"];
    
    @weakify(self);
    
    [weakself showProgressHUD];
    
    [[NetworkManager shareNetworkManager] sendRequest:request success:^(id responseObject) {
        
        _hasData = YES;
        
        [weakself hiddenProgressHUD];
        
    } faile:^(NetworkError *error) {
        
        
        _hasData = NO;
        
    }];
    
}


- (void)clickRightItem {
    
    _hasData = YES;
    
    FindDetailViewController *detail = [[FindDetailViewController alloc] init];
  
    self.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:detail animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;
    
}


#pragma mark - DZNEmptyDataSetSource


// 标题文本，富文本样式
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"titleForEmptyDataSet";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor redColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

//副标题
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[NSDate bb_dateStringWithDate:[NSDate date] formatterString:@"YYYY-MM-dd HH:mm:ss"] attributes:@{
                                                                                                                      NSFontAttributeName :[UIFont systemFontOfSize:15.0f],
                                                                                                                      NSForegroundColorAttributeName :[UIColor blackColor]
                                                                                                                      }];
    
    return  string;
    
}


- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    
    return [UIImage imageNamed:@"loading"];
    
}

- (UIColor *)imageTintColorForEmptyDataSet:(UIScrollView *)scrollView {
    
    return [UIColor whiteColor];
    
}


- (CAAnimation *) imageAnimationForEmptyDataSet:(UIScrollView *) scrollView {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
    
    animation.duration = 0.3;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
  
    return animation;
    
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    
    NSAttributedString *buttonTitle = [[NSAttributedString alloc] initWithString:@"点击刷新" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName: [UIColor purpleColor]}];
    
    return buttonTitle;
    
}


- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    
    return [UIColor lightGrayColor];
    
}


//垂直方向的偏移量
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    
    return -20;
    
}

//几个控件之间的垂直间距(默认是11)
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    
    return 11;
    
}

#pragma mark - DZNEmptyDataSetDelegate

- (BOOL)emptyDataSetShouldFadeIn:(UIScrollView *)scrollView {
    
    return YES;
    
}

//图片是否允许动画
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView{
    
    return YES;
    
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    
    return YES;
    
}

- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
    
    NSLog(@"emptyDataSetDidTapView");
    
}

//点击刷新按钮
- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView  {
    
    NSLog(@"emptyDataSetDidTapButton");
    
    
    [self getDataFromNetwork];
    
    [self.tbv reloadData];

}

- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView {
    
    
}

#pragma mark - tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (_hasData) {
      
        return 1;
    
    }
    
    return 0;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (_hasData) {
       
        return 1;
    
    }
    
    return 0;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
    
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    cell.textLabel.text = @"测试数据啊";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionBottom];
    
}

@end
