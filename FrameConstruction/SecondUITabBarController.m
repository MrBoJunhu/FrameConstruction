//
//  SecondUITabBarController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "SecondUITabBarController.h"

#import "ContactsViewController.h"

#import "ChatViewController.h"

#import "FindViewController.h"

@interface SecondUITabBarController ()

@end

@implementation SecondUITabBarController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}


- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    [self addChildVC:[[FindViewController alloc] init] title:@"发现" selectedImageName:@"find" nomalImageName:@"find_selected"];
    
    [self addChildVC:[[ChatViewController alloc] init] title:@"会话" selectedImageName:@"chat_selected" nomalImageName:@"chat"];
    
    [self addChildVC:[[ContactsViewController alloc] init] title:@"通讯录" selectedImageName:@"contacts_selected" nomalImageName:@"contacts"];
    
}

- (void)didReceiveMemoryWarning {
   
    [super didReceiveMemoryWarning];

}



@end
