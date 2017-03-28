//
//  TwoViewController.m
//  NavigationControllerTest
//
//  Created by wangyaning on 2017/3/24.
//  Copyright © 2017年 wangyaning. All rights reserved.
//

#import "TwoViewController.h"

#import "WYNNavTitleView.h"
@interface TwoViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    WYNNavTitleView *titleView = [[WYNNavTitleView alloc] initWithFrame:CGRectMake(0, 0, 200, 40) ImageName:@"dropdown_anim__00013" title:@"你好hhahahahaahahah"];
    
    titleView.bounds = CGRectMake(0, 0, titleView.selfWidth, 40);
    self.navigationItem.titleView = titleView;

    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.navigationBar.alpha = scrollView.contentOffset.y/150;
    
}
- (BOOL)isTranslucent{
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
