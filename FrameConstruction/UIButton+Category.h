//
//  UIButton+Category.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/1.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

/**
 初始化

 @param frame frame description
 @param backgroundColor backgroundColor description
 @param title title description
 @param titleColor titleColor description
 @param highlightedColor highlightedColor description
 @param target target description
 @param selector selector description
 @return return value description
 */
+(instancetype)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titleColor highlightedColor:(UIColor *)highlightedColor target:(id)target selector:(SEL)selector;


/**
 设置圆角 边框样式

 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @param radius 圆角
 */
- (void)setBorderStyleBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)radius;

@end
