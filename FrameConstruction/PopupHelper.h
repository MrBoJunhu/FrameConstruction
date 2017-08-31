//
//  PopupHelper.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PopupStyle) {
    
    OnleyMessage_PopupStyle = 0,
    
    TextField_PopupStyle,
    
};

typedef void(^clickSureBlock)(id result);

typedef void(^cancelBlock)();

@interface PopupHelper : NSObject

+(instancetype)sharePopupHelper;

- (void)showPopupWithTitle:(NSString *)title message:(NSString *)message sureButtonTitle:(NSString *)sureTitle cancelTitle:(NSString *)cancelTitle popupStyle:(PopupStyle)style viewController:(UIViewController *)controller clickSure:(clickSureBlock)sure clickCancel:(cancelBlock)cancel;

@end
