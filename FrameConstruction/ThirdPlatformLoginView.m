//
//  ThirdPlatformLoginView.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/6.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ThirdPlatformLoginView.h"

@interface ThirdPlatformLoginView(){
    
    CGFloat basicV_Height;
    
}

@property (nonatomic, strong) UIView *backGroundView;

@property (nonatomic, strong) UIView *basicView;

@property (nonatomic, copy) clickPlatformBlock clickPlatform;


@end

@implementation ThirdPlatformLoginView

+ (instancetype)platformLoginViewWithTitles:(NSArray *)titles images:(NSArray *)images clickPlatform:(clickPlatformBlock)platformClick{
    
    ThirdPlatformLoginView *v = [[ThirdPlatformLoginView alloc] initWithFrame:[UIScreen mainScreen].bounds Titles:titles images:images clickPlatform:platformClick];
    
    return v;
}

- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles images:(NSArray *)images clickPlatform:(clickPlatformBlock)platformClick{
    
    if (self = [super initWithFrame:frame]) {
        
        self.clickPlatform = platformClick;
        
        self.backgroundColor = [UIColor clearColor];
        
        basicV_Height = 80;
        
        self.basicView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, basicV_Height)];
        
        CGFloat button_width = 70;
        
        CGFloat button_height = 70;
        
        CGFloat space = (self.basicView.frame.size.width - 3 * button_width) / 4;
        
        CGFloat origin_y = 5;
        
        for (NSUInteger i = 0; i < 3; i ++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            NSAttributedString *attString = [[NSAttributedString alloc] initWithString:titles[i] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]}];
            
            [btn setAttributedTitle:attString forState:UIControlStateNormal];
            
            btn.frame = CGRectMake(space + (space + button_width) * i, origin_y, button_width, button_height);
            
            [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
            
            btn.tag = i;
            
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.basicView addSubview:btn];
            
            [btn layoutButtonWithEdgeInsetsStyle:BBButtonEdgeInsetsStyleTop imageTitleSpace:10];
            
        }
        
        self.basicView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.basicView];
        
        
        
    }
    
    return self;
    
}

- (void)clickBtn:(UIButton *)sender {
    
    if (self.clickPlatform) {
        
        self.clickPlatform(sender.tag);
        
        [self dismiss];
        
    }
    
}



- (void)show {
    
    for (UIView *v in self.subviews) {
        
        v.hidden = YES;
        
    }
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.backGroundView = [[UIView alloc] initWithFrame:window.bounds];
    
    self.backGroundView.backgroundColor = [UIColor blackColor];
    
    self.backGroundView.alpha = 0.0;
    
    [window addSubview:self.backGroundView];
    
    [window addSubview:self];
    
    
    @weakify(self);
    
    [UIView animateWithDuration:0.3 animations:^{
       
        weakself.backGroundView.alpha = 0.5;
        
        for (UIView *v in self.subviews) {
            
            v.hidden = NO;
            
        }
        
        [weakself setViewOriginY:weakself.frame.size.height - basicV_Height view:self.basicView];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)setViewOriginY:(CGFloat)origin_Y view:(UIView *)view {
    
    view.frame = CGRectMake(0, origin_Y, self.frame.size.width, basicV_Height);

}


- (void)dismiss{
    
    for (UIView *v in self.subviews) {
        
        [v removeFromSuperview];
        
    }
    
    @weakify(self);
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [weakself setViewOriginY:weakself.frame.size.height view:weakself.basicView];
       
        weakself.backGroundView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
       
        if (finished) {
            
            [weakself removeFromSuperview];
            
            [weakself.backGroundView removeFromSuperview];
            
        }
        
    }];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIView *v = [touches anyObject].view;
    
    if (v == self) {
        
        [self dismiss];
        
    }
    
}
@end
