//
//  UIButton+Category.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/1.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

+(instancetype)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titleColor highlightedColor:(UIColor *)highlightedColor target:(id)target selector:(SEL)selector {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (backgroundColor) {
        
        btn.backgroundColor = backgroundColor;
        
    }
    
    [btn setButtonFrame:frame];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (highlightedColor) {
        
        [btn setTitleColor:highlightedColor forState:UIControlStateHighlighted];

    }
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)setBorderStyleBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)radius{
    
    if (radius > 0 ) {
        
        self.layer.cornerRadius = radius;
        
    }
    
    if (borderWidth > 0 ) {
        
        self.layer.borderWidth = borderWidth;

    }
    if (borderColor) {
        
        self.layer.borderColor = borderColor.CGColor;

    }
}


- (void)setButtonFrame:(CGRect)frame {
    
    self.frame = frame;
    
}


- (void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor controlState:(UIControlState)state{
    
    [self setTitle:title forState:state];
    
    [self setTitleColor:titleColor forState:state];
    
}

@end
