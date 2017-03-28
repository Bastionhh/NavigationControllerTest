//
//  ViewController.m
//  NavigationControllerTest
//
//  Created by wangyaning on 2017/3/23.
//  Copyright © 2017年 wangyaning. All rights reserved.
//

#import "ViewController.h"

#import "TwoViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIImageView * topImageView;

@property (nonatomic, weak) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    UIView * topBkView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 78, 44)];
    topBkView.backgroundColor = [UIColor clearColor];
    
    _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 78, 78)];
    _topImageView.backgroundColor = [UIColor whiteColor];
    _topImageView.layer.cornerRadius = _topImageView.bounds.size.width / 2.;
    _topImageView.layer.masksToBounds = YES;
    _topImageView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    _topImageView.image = [UIImage imageNamed:@"dropdown_anim__00013"];
    [topBkView addSubview:_topImageView];
    
    self.navigationItem.titleView = topBkView;

}

#pragma mark - tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"CELL";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.backgroundColor = [self randomColor];
    
    return cell;
}

- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    
    return [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:1];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TwoViewController *vc = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - 滑动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y + _tableView.contentInset.top;//注意
    
    /**
     *  1 - offsetY/num1 = 0.45;
     0.45 为最终缩小倍率
     offsetY 为纵偏移量
     num1=300 为要计算的值
     150/165  就是滑动多少距离后，完成缩放
     */
    
    if (offsetY < 0 && offsetY >= -150) {
        _topImageView.transform = CGAffineTransformMakeScale(1 + offsetY/(-300), 1 + offsetY/(-300));
        //        _topImageView.layer.anchorPoint = CGPointMake(0.5, offsetY/600. + 0.5);
        //        NSLog(@"%lf - %lf", offsetY, 1 + offsetY/(-300));
    }
    else if (offsetY >= 0 && offsetY <= 165) {
        _topImageView.transform = CGAffineTransformMakeScale(1 - offsetY/300, 1 - offsetY/300);
        //        _topImageView.layer.anchorPoint = CGPointMake(0.5, 0.5 + offsetY/600.);
    }
    else if (offsetY > 165) {
        _topImageView.transform = CGAffineTransformMakeScale(0.45, 0.45);
        //        _topImageView.layer.anchorPoint = CGPointMake(0.5, 1);
    }
    else if (offsetY < -150) {
        _topImageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
        //        _topImageView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    }
    
    CGRect frame = _topImageView.frame;
    frame.origin.y = 5;
    _topImageView.frame = frame;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
