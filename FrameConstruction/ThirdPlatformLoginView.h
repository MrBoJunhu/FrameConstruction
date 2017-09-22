//
//  ThirdPlatformLoginView.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/6.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickPlatformBlock)(NSUInteger index);

@interface ThirdPlatformLoginView : UIView

+(instancetype)platformLoginViewWithTitles:(NSArray *)titles images:(NSArray *)images clickPlatform:(clickPlatformBlock)platformClick;

- (void)show;

- (void)dismiss;

@end
