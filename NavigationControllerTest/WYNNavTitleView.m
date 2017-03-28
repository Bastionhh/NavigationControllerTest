//
//  WYNNavTitleView.m
//  NavigationControllerTest
//
//  Created by wangyaning on 2017/3/24.
//  Copyright © 2017年 wangyaning. All rights reserved.
//

#import "WYNNavTitleView.h"

@implementation WYNNavTitleView

- (instancetype)initWithFrame:(CGRect)frame ImageName:(NSString *)imageName title:(NSString *)title{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        image.layer.cornerRadius = 20;
        image.layer.masksToBounds = YES;
        image.image = [UIImage imageNamed:imageName];
        [self addSubview:image];
        
        CGSize titleSize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size;
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(image.frame)+10, image.frame.origin.y, titleSize.width, 40)];
        titleLab.text = title;
        titleLab.font = [UIFont systemFontOfSize:18];
        [self addSubview:titleLab];
        
        _selfWidth = CGRectGetMaxX(titleLab.frame);
    }
    
    return self;
}

@end
