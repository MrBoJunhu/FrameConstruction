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

-(void)showPopupWithTitle:(NSString *)title message:(NSString *)message popupStyle:(PopupStyle)style viewController:(UIViewController *)controller clickSure:(clickSureBlock)sure clickCancel:(cancelBlock)cancel {
    
    self.title = title;
    
    self.msg = message.length > 0 ? message : @"";
    
    self.controller =  controller;
    
    self.sureBlock = sure;
    
    self.cancelBlock = cancel;
    
    switch (style) {
        case TextField_PopupStyle:
        {
            [self textFieldPopup];
        }
            break;
            
        default:
            break;
    }
    
}


- (void)textFieldPopup{
    
    if (!self.controller) {
        return;
    }
    
    @weakify(self);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:self.title message:self.msg preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        

        
    }];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        if (weakself.cancelBlock) {
            
            weakself.cancelBlock();
            
        }
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定"
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
