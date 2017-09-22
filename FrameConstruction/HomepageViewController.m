//
//  HomepageViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/28.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "HomepageViewController.h"

#import "SecondUITabBarController.h"

#import "ThirdPlatformLoginView.h"
@interface HomepageViewController ()

@end

@implementation HomepageViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self cleanBradgeAtIndex:0];
    
    
}

- (void)loginTest {
 
    ThirdPlatformLoginView *loginV = [ThirdPlatformLoginView platformLoginViewWithTitles:@[@"QQ",@"微信",@"微博"] images:@[@"qq",@"wechat",@"weibo"] clickPlatform:^(NSUInteger index) {
        
    }];
    
    [loginV show];
    
}


- (void)viewDidLoad {
  
    [super viewDidLoad];
    
    self.navigationItem.title = @"主页";
    
    [self setRightNavigationItem];
    
    NSLog(@"%@", [NSDate bb_dateWithDateString:@"2017-12-23 11:32:21" formatterString:@"YYYY-MM-dd hh:mm:ss"]);
    
    UIButton *login = [UIButton buttonWithFrame:CGRectMake(0, 0, 100, 40) backgroundColor:[UIColor whiteColor] title:@"第三方登录" titleColor:[UIColor lightGrayColor] highlightedColor:[UIColor lightTextColor] target:self selector:@selector(loginTest)];
    
    login.center = self.view.center;
    
    [self.view addSubview:login];

}

- (void)clickRightItem {
    
    SecondUITabBarController *secondTabbarVC = [[SecondUITabBarController alloc] init];
    
    self.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:secondTabbarVC animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;
    
}

- (void)didReceiveMemoryWarning {
   
    [super didReceiveMemoryWarning];

}

@end
