//
//  UIViewController+HUD.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/5.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "UIViewController+HUD.h"

#import "UIView+HUD.h"
#import <objc/runtime.h>
@implementation UIViewController (HUD)



- (void)showProgressHUD{
    
    [self.view bringSubviewToFront:self.view.hud];
    
    
}

- (void)hiddenProgressHUD{
    
    if (self.view.hud) {
        
        [self.view.hud removeFromSuperview];
        
    }
    
}

@end
