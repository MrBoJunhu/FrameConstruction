

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BBButtonEdgeInsetsStyle) {
    BBButtonEdgeInsetsStyleTop, // image在上，label在下
    BBButtonEdgeInsetsStyleLeft, // image在左，label在右
    BBButtonEdgeInsetsStyleBottom, // image在下，label在上
    BBButtonEdgeInsetsStyleRight // image在右，label在左
};


@interface UIButton (UIButton_ImageTitle)
/*
 *
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(BBButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
