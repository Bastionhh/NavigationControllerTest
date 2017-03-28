//
//  WYNBaseViewController.h
//  NavigationControllerTest
//
//  Created by wangyaning on 2017/3/23.
//  Copyright © 2017年 wangyaning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNBaseViewController : UIViewController

// 带毛玻璃效果创建这个
@property (nonatomic, strong) UINavigationBar *navigationBar;
// 不带毛玻璃效果的
@property (nonatomic, strong) UIView *navView;

- (BOOL)isTranslucent;

@end
