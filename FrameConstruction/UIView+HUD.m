//
//  UIView+HUD.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/5.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "UIView+HUD.h"

#import <objc/runtime.h>

@implementation UIView (HUD)

+(void)load {
    
    SEL originalSelector = @selector(didAddSubview:);
    
    SEL overrideSelector = @selector(bb_didAddSubview:);
    
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
   
    Method overrideMethod = class_getInstanceMethod(self, overrideSelector);
    
    if (class_addMethod(self, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        
        class_replaceMethod(self, overrideSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
   
    } else {
      
        method_exchangeImplementations(originalMethod, overrideMethod);
    
    }
    
}


- (void)bb_didAddSubview:(UIView *)subview{
  
    [self bb_didAddSubview:subview];
    
    if (self.hud) {
        
        [self bringSubviewToFront:self.hud];
        
    }
    
}


- (MBProgressHUD *)hud{
    
    return objc_getAssociatedObject(self, @selector(hud));
}

- (void)setHud:(MBProgressHUD *)hud{
    
    objc_setAssociatedObject(self, @selector(hud), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)setupHud{
    
    if (!self.hud) {
        
        self.hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        self.hud.removeFromSuperViewOnHide = NO;
        
    }
    
}

@end
