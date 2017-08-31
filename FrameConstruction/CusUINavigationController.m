//
//  CusUINavigationController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "CusUINavigationController.h"

@interface CusUINavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>


@end

@implementation CusUINavigationController


- (void)loadView{
    
    [super loadView];
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
  
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    self.delegate = self;

}

#pragma mark - 让手势生效

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    if (self.viewControllers.count <= 1) {
        
        return NO;
        
    }else{
        
        return YES;
    }
    
}

#pragma mark - 允许响应多个手势

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
    
}

#pragma mark - 禁止响应手势的是否ViewController中scrollView跟着滚动

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return [gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]];
    
}

#pragma mark - 在push动画发生的时候, 禁止滑动手势, 因为push动作还没完成, 逻辑上是不允许这个是否进行滑动.重写pushViewController:XX方法.

//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    self.interactivePopGestureRecognizer.enabled = YES;
//    
//}

///*
// 
// 在使用navigationController的viewController里面添加
// 
// - (void)viewDidAppear:(BOOL)animated {
// [super viewDidAppear:animated];
// self.navigationController.interactivePopGestureRecognizer.enabled = YES;
// }
//
// 或者使导航控制器成为自身的代理, 监听Push完成后的ViewController
// 
// */
//
//- (void)navigationController:(UINavigationController *)navigationController
//       didShowViewController:(UIViewController *)viewController
//                    animated:(BOOL)animate {
//    
//    //控制器入栈之后,启用手势识别
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//       
//        self.interactivePopGestureRecognizer.enabled = YES;
//    
//    }
//    
//}
//
//- (void)didReceiveMemoryWarning {
// 
//    [super didReceiveMemoryWarning];
//
//}

@end
