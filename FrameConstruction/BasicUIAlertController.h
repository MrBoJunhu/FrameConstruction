//
//  BasicUIAlertController.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickCancelBlock)();

typedef void(^clickSureBlock)(id result);

@interface BasicUIAlertController : UIAlertController

@property (nonatomic,copy) clickCancelBlock cancelBlock;

@property (nonatomic, copy) clickSureBlock sureBlock;

- (void)show:(UIViewController *)vc clickSure:(clickSureBlock)sure clickCancel:(clickCancelBlock)cancel;


@end
