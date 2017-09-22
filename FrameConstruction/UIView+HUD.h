//
//  UIView+HUD.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/5.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)

@property (nonatomic, strong, readonly) MBProgressHUD *hud;

- (void)setupHud;


@end
