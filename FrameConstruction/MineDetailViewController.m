//
//  MineDetailViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "MineDetailViewController.h"

@interface MineDetailViewController ()

@end

@implementation MineDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"我的详情页";
    
    UIButton *playBtn = [UIButton buttonWithFrame:CGRectMake(10, 100, 150, 40) backgroundColor:[UIColor whiteColor] title:@"播放测量成功" titleColor:[UIColor blackColor] highlightedColor:[UIColor lightGrayColor] target:self selector:@selector(playTest:)];
    
    [self.view addSubview:playBtn];
    
    UIButton *pauseBtn = [UIButton buttonWithFrame:CGRectMake(10, 300, 150, 40) backgroundColor:[UIColor whiteColor] title:@"暂停播放" titleColor:[UIColor blackColor] highlightedColor:[UIColor lightGrayColor] target:self selector:@selector(pausePlay:)];
    
    [self.view addSubview:pauseBtn];
    
}

- (void)pausePlay:(UIButton *)sender {
    
    [[VoiceManager manager] stopPlayVoice];
    
}


- (void)playTest:(UIButton *)sender {
    
    [[VoiceManager manager] playVoice:@[BEFORE_CONNECT, AFTER_CONNECT, MEASURING, MEASURING_OVER_DING]];
    
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
        
}

@end
