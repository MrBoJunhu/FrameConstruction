//
//  UITabBarController+Category.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "UITabBarController+Category.h"

@implementation UITabBarController (Category)

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title selectedImageName:(NSString *)selectedImage nomalImageName:(NSString *)nomalImageName {
    
    CusUINavigationController *nav = [[CusUINavigationController alloc] initWithRootViewController:vc];
    
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    vc.tabBarItem.image = [UIImage imageNamed:nomalImageName];
    
    vc.tabBarItem.title = title;
    
    [self addChildViewController:nav];
    
}

@end
