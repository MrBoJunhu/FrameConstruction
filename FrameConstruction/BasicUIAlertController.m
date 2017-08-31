//
//  BasicUIAlertController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "BasicUIAlertController.h"

@interface BasicUIAlertController ()

@end

@implementation BasicUIAlertController

- (void)show:(UIViewController *)vc clickSure:(clickSureBlock)sure clickCancel:(clickCancelBlock)cancel {
    
    self.sureBlock = sure;
    
    self.cancelBlock = cancel;
    
    [vc presentViewController:self animated:YES completion:^{
        
    }];
    
}


- (void)viewDidLoad {
  
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
