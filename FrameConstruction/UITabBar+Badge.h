//
//  UITabBar+Badge.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)


/**
 显示小红点

 @param index index description
 @param badgeValue badgeValue description
 @param maxValue maxValue description
 */
- (void)showBadgeAtIndex:(NSUInteger)index badgeValue:(NSNumber *)badgeValue maxBadgeValue:(NSNumber *)maxValue;


/**
 移除小红点

 @param index index description
 */
- (void)removeBadgeAtIndex:(NSUInteger)index;

@end
