//
//  UITabBar+Badge.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "UITabBar+Badge.h"

static NSUInteger MINTAG = 666;

static CGFloat BADGE_FONT_SIZE = 10;

static CGFloat BADGE_WIDTH = 16;

@implementation UITabBar (Badge)

- (void)showBadgeAtIndex:(NSUInteger)index badgeValue:(NSNumber *)badgeValue maxBadgeValue:(NSNumber *)maxValue{
    
    [self removeBadgeAtIndex:index];
    
    if (badgeValue.integerValue == 0) {
        
        return;
    }
    
    NSUInteger itemCount = self.items.count;
    
    BOOL outOfBounds = maxValue ? (badgeValue.integerValue > maxValue.integerValue ? YES : NO) : NO;
    
    NSString *stringValue = outOfBounds ? [NSString stringWithFormat:@"%@+",maxValue] : badgeValue.stringValue;
    
    CGFloat string_width = [NSString widthForString:stringValue fontSize:BADGE_FONT_SIZE];
        
    CGFloat lb_width = BADGE_WIDTH > string_width ? BADGE_WIDTH : string_width;
    
    CGFloat lb_height = BADGE_WIDTH;
    
    CGFloat tabbar_width = self.frame.size.width;
    
    CGFloat item_width = tabbar_width/itemCount;
    
    UILabel *badgeLB = [[UILabel alloc] init];
    
    badgeLB.backgroundColor = [UIColor redColor];
    
    badgeLB.layer.cornerRadius = lb_height/2;
    
    badgeLB.layer.masksToBounds = YES;
    
    badgeLB.textAlignment = NSTextAlignmentCenter;
    
    badgeLB.font = [UIFont systemFontOfSize:BADGE_FONT_SIZE];
    
    badgeLB.textColor = [UIColor whiteColor];
    
    badgeLB.text = stringValue;

    badgeLB.tag = MINTAG + index;
    
    CGFloat orign_Y = 1;
    
    badgeLB.frame = CGRectMake(item_width * (index + 0.6), orign_Y, lb_width, lb_height);
    
    [self addSubview:badgeLB];
    
}

- (void)removeBadgeAtIndex:(NSUInteger)index{
    
    
    for (UIView *view in self.subviews) {
        
        
        if (view.tag == MINTAG+index) {
            
            [view removeFromSuperview];
            
        }
        
    }
    
}

@end
