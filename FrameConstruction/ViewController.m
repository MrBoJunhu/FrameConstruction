//
//  ViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/28.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ViewController.h"
#import "ZHScanView.h"
@interface ViewController (){
    
    ZHScanView *scanView;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    scanView = [[ZHScanView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height)];
    

    scanView.promptMessage = @"请扫描二维码";
    
    [scanView startScaning];
    
    [scanView outPutResult:^(NSString *result) {
        
        NSLog(@"扫描结果 result %@", result);
        
    }];
    
    [self.view addSubview:scanView];
    
}

- (void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [scanView scanAgain];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
