//
//  UILabel+Category.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/4.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)
+(instancetype)initWitFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textAligment:(NSTextAlignment)textAligment font:(UIFont *)font lines:(NSUInteger)lineNumber;
@end
