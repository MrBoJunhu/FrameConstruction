//
//  UILabel+Category.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/4.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (instancetype)initWitFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textAligment:(NSTextAlignment)textAligment font:(UIFont *)font lines:(NSUInteger)lineNumber {
    
    UILabel *lb = [[UILabel alloc] init];
    
    lb.frame = frame;
    
    lb.backgroundColor = backgroundColor ? backgroundColor : [UIColor clearColor];
    
    lb.textColor = textColor ? textColor : [UIColor darkTextColor];
    
    lb.font = font;
    
    lb.numberOfLines = lineNumber;
    
    lb.lineBreakMode = NSLineBreakByWordWrapping;
    
    lb.textAlignment = textAligment;
    
    return lb;
}

@end
