//
//  WYNNavTitleView.h
//  NavigationControllerTest
//
//  Created by wangyaning on 2017/3/24.
//  Copyright © 2017年 wangyaning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNNavTitleView : UIView

- (instancetype)initWithFrame:(CGRect)frame ImageName:(NSString*)imageName title:(NSString*)title;

@property (nonatomic,readonly, assign) CGFloat selfWidth;
@end
