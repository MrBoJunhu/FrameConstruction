//
//  UIViewController+Category.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

- (void)setRightNavigationItem{
    
    @weakify(self);
    
    self.navigationItem.rightBarButtonItem = [[BBUIBarButtonItem alloc] initWithTitle:@"下一页" clickHandle:^{
        
        [weakself clickRightItem];
        
    }];
    
}

- (void)setLeftNavigationItem {
  
    @weakify(self);
    
    self.navigationItem.leftBarButtonItem = [[BBUIBarButtonItem alloc] initWithTitle:@"返回" clickHandle:^{
        
        [weakself clickLeftItem];
        
    }];

    
}

- (void)clickLeftItem {
    
    if (self.navigationController) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
}

- (void)clickRightItem {
    
    
}

- (void)setBradgeNumberAtIndex:(NSUInteger)index bradgeNumber:(NSUInteger)number{
    
    [self.tabBarController.tabBar showBadgeAtIndex:index badgeValue:[NSNumber numberWithInteger:number] maxBadgeValue:@901];
    
}

- (void)cleanBradgeAtIndex:(NSUInteger)index{
   
    [self.tabBarController.tabBar removeBadgeAtIndex:index];
    
}


- (void)showProgressHUD {
    
    [MBProgressHUD bwm_showHUDAddedTo:[UIApplication sharedApplication].keyWindow title:@"加载中..." animated:YES];
    
}

- (void)showProgressHUDWithText:(NSString *)msg andHiddenAfter:(NSTimeInterval)time {
    
    [self hiddenProgressHUD];
    
    [MBProgressHUD bwm_showTitle:msg toView:[UIApplication sharedApplication].keyWindow hideAfter:time];
    
}

- (void)hiddenProgressHUD{
   
    [MBProgressHUD hideAllHUDsForView:[UIApplication sharedApplication].keyWindow animated:YES];
    
}
@end
