//
//  WYNNavigationController.m
//  NavigationControllerTest
//
//  Created by wangyaning on 2017/3/23.
//  Copyright © 2017年 wangyaning. All rights reserved.
//  可以干啥：很方便的切换带有毛玻璃效果和不带的的导航。

#import "WYNNavigationController.h"

@interface WYNNavigationController ()

@end

@implementation WYNNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 去掉自带nav背景和横线。 用新创建的nav或者View代替
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    // 修改返回按钮的图片
    UIImage *backImage = [[[UIImage imageNamed:@"hunlidaka_icon_fanhui"]
                           imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                          imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UINavigationBar appearance] setBackIndicatorImage:backImage];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backImage];
    
    //参考自定义文字部分。 去掉返回按钮文字
  //  [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin)forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
