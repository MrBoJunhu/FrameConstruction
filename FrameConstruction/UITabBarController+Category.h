//
//  UITabBarController+Category.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/29.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (Category)

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title selectedImageName:(NSString *)selectedImage nomalImageName:(NSString *)nomalImageName;

@end
