//
//  WYNBaseViewController.m
//  NavigationControllerTest
//
//  Created by wangyaning on 2017/3/23.
//  Copyright © 2017年 wangyaning. All rights reserved.
//

#import "WYNBaseViewController.h"

@interface WYNBaseViewController ()

@end

@implementation WYNBaseViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 毛玻璃效果
        _navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 64)];
        _navigationBar.tintColor = [UIColor whiteColor];
        // 无毛玻璃效果
        _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 64)];
        _navView.backgroundColor = [UIColor whiteColor];
        
        
        
        if ([self isTranslucent]) {
            _navigationBar.alpha = 0;
        }
        [self.view addSubview:_navigationBar];
        
        // 返回按钮文字自定义
        //重新创建一个barButtonItem
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"消息(99)" style:UIBarButtonItemStylePlain target:nil action:nil];
        //设置backBarButtonItem即可
        self.navigationItem.backBarButtonItem = backItem;
    }
    return self;
}

- (void)viewDidLayoutSubviews {
    [self.view bringSubviewToFront:_navView];
}
// 控制是否隐藏navBar；
- (BOOL)isTranslucent {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
