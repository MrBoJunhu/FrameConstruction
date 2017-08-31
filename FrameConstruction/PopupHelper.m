//
//  PopupHelper.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "PopupHelper.h"

@interface PopupHelper ()

@property (nonatomic, copy) clickSureBlock sureBlock;

@property (nonatomic, copy) cancelBlock cancelBlock;

@property (nonatomic, strong) UIViewController * controller;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *sureTitle;

@property (nonatomic, copy) NSString *cancelTitle;


@property (nonatomic, copy) NSString *msg;


@end

@implementation PopupHelper

+(instancetype)sharePopupHelper {
    
    static PopupHelper *helper = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc] init];
    });
    return helper;
}

-(void)showPopupWithTitle:(NSString *)title message:(NSString *)message sureButtonTitle:(NSString *)sureTitle cancelTitle:(NSString *)cancelTitle popupStyle:(PopupStyle)style viewController:(UIViewController *)controller clickSure:(clickSureBlock)sure clickCancel:(cancelBlock)cancel {
    
    self.title = title;
    
    self.sureTitle = sureTitle.length > 0 ? sureTitle :@"确定";
    
    self.cancelTitle = cancelTitle.length > 0 ? cancelTitle : @"取消";
    
    self.msg = message.length > 0 ? message : @"";
    
    self.controller =  controller;
    
    self.sureBlock = sure;
    
    self.cancelBlock = cancel;
    
    switch (style) {
        case OnleyMessage_PopupStyle:
        {
            [self messagePopupDoNothing];
        }
            break;
        case TextField_PopupStyle:
        {
            [self textFieldPopup];
        }
            break;
            
        default:
            break;
    }
    
}

- (void)messagePopupDoNothing {
    
    @weakify(self);
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:self.title message:self.msg preferredStyle:UIAlertControllerStyleAlert];
    
    [alertC addAction:[UIAlertAction actionWithTitle:self.sureTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        if (weakself.sureBlock) {
            
            weakself.sureBlock(nil);
            
        }
        
    }]];
    
    [self.controller presentViewController:alertC animated:YES completion:^{
        
    }];
    
}



- (void)textFieldPopup{
    
    if (!self.controller) {
        return;
    }
    
    @weakify(self);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:self.title message:self.msg preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        

        
    }];
    
    [alert addAction:[UIAlertAction actionWithTitle:self.cancelTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        if (weakself.cancelBlock) {
            
            weakself.cancelBlock();
            
        }
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:self.sureTitle
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
                                                
                                                if (weakself.sureBlock) {
                                                    
                                                    weakself.sureBlock(alert.textFields.firstObject.text);
                                                    
                                                }
                                                
                                            }]];
    
    [self.controller presentViewController:alert animated:YES completion:^{
        
        
    }];

    
}

@end
