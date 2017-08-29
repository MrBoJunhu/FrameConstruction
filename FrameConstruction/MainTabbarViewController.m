//
//  MainTabbarViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/28.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "MainTabbarViewController.h"

#import "HomepageViewController.h"

#import "ScanViewController.h"

#import "MineViewController.h"

@interface MainTabbarViewController ()


@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -8, self.tabBar.frame.size.width, self.tabBar.frame.size.height)];
    
    [imageView setImage:[UIImage imageNamed:@"tabbar_bg"]];
    
    [imageView setContentMode:UIViewContentModeCenter];
    
    [self.tabBar insertSubview:imageView atIndex:0];
    
    //覆盖原生Tabbar的上横线
    
    [[UITabBar appearance] setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    
    [[UITabBar appearance] setBackgroundImage:[self createImageWithColor:[UIColor clearColor]]];
    
    //设置TintColor
    UITabBar.appearance.tintColor = [UIColor blueColor];

    [self addChildVC:[[HomepageViewController alloc] init] title:@"首页" selectedImageName:@"TabBar_Item_1_selected" nomalImageName:@"TabBar_Item_1"];
    
    [self addChildVC:[[ScanViewController alloc]init] title:@"扫一扫" selectedImageName:@"tabbaritem_selected_动态" nomalImageName:@"tabbaritem_动态"];
    
    [self addChildVC:[[MineViewController alloc] init] title:@"我的" selectedImageName:@"TabBar_Item_5_selected" nomalImageName:@"TabBar_Item_5"];
    
}


-(UIImage*) createImageWithColor:(UIColor*) color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
  
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;

}


#pragma mark - 设置中间按钮不受TintColor影响

- (void)awakeFromNib {
   
    [super awakeFromNib];
    
    NSArray *items =  self.tabBar.items;
    
    UITabBarItem *btnAdd = items[2];
    
    btnAdd.image = [btnAdd.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    btnAdd.selectedImage = [btnAdd.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title selectedImageName:(NSString *)selectedImage nomalImageName:(NSString *)nomalImageName {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    vc.tabBarItem.image = [UIImage imageNamed:nomalImageName];
    
    vc.tabBarItem.title = title;
    
    [self addChildViewController:nav];
    
}


@end
