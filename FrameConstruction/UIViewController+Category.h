//
//  UIViewController+Category.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)

- (void)setRightNavigationItem;

- (void)setLeftNavigationItem;

- (void)clickLeftItem;

- (void)clickRightItem;


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


/**
 显示菊花
 */
- (void)showProgressHUD;

/**
 显示加载文字,一段时间后消失
 
 @param msg msg description
 @param time time description
 */
- (void)showProgressHUDWithText:(NSString *)msg andHiddenAfter:(NSTimeInterval)time;


/**
 隐藏菊花
 */
- (void)hiddenProgressHUD;

@end
