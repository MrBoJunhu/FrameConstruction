//
//  UIViewController+Category.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBProgressHUD;

@interface UIViewController (Category)

- (void)setRightNavigationItem;

- (void)setLeftNavigationItem;

- (void)clickLeftItem;

- (void)clickRightItem;

/**
 不显示tableview多余的分割线

 @param tableView tableView description
 */
- (void)hiddenTableViewFooterView:(UITableView *)tableView;


/**
 设置tabbarItem Bradge

 @param index index description
 @param number number description
 */
- (void)setBradgeNumberAtIndex:(NSUInteger)index bradgeNumber:(NSUInteger)number;



/**
 清空bradge

 @param index index description
 */
- (void)cleanBradgeAtIndex:(NSUInteger)index;



@end
