//
//  ContactsViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

    [self setBradgeNumberAtIndex:1 bradgeNumber:1001];
    
}

- (void)viewDidLoad {
  
    [super viewDidLoad];
    
    self.title = @"通讯录";

}


@end
