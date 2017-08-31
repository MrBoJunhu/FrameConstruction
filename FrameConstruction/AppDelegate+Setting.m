//
//  AppDelegate+Setting.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/28.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "AppDelegate+Setting.h"

@implementation AppDelegate (Setting)

- (void)test {
    
    NSLog(@"测试!");
    //导航栏标题字体
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                          NSFontAttributeName : [UIFont systemFontOfSize:20],
                                                          
                                                          NSForegroundColorAttributeName : [UIColor whiteColor]
                                                          }];
    //设置不透明
    [UINavigationBar appearance].translucent = YES;
    //导航栏颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    //
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    //设置 barButtonItem 颜色
//    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
   
    
    //工具栏
    [[UITabBar appearance] setBarTintColor:[UIColor redColor]];
   
    //工具栏背景色
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    

}

@end
