//
//  ThirdViewController.m
//  Syswin
//
//  Created by 王培荣 on 2018/4/10.
//  Copyright © 2018年 wangpeirong. All rights reserved.
//

#import "ThirdViewController.h"
#import "TestViewController.h"

@interface ThirdViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray  *dataArray;
@property (nonatomic,strong)UITableView     *tableView;
@property (nonatomic,strong)UIView          *tableFootView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNaviLeftTitle:@"返回"];
    [self setNaviBarTitle:@"自定义试图"];
    
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CELL = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL];
        cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
        NSArray *array = @[@"亲猫儿",@"爱你哦"];
        [_dataArray addObjectsFromArray:array];
    }
    
    return _dataArray;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.tableFootView;
        
    }
    return _tableView;
    
}
- (UIView *)tableFootView
{
    if (!_tableFootView) {
        _tableFootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
        _tableFootView.backgroundColor = kCyanColor;
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
        lable.backgroundColor = [UIColor yellowColor];
        lable.text = @"hehehehe";
        lable.textColor = [UIColor blackColor];
        lable.center = _tableFootView.center;
        lable.textAlignment = NSTextAlignmentCenter;
        [lable setFont:[UIFont systemFontOfSize:22]];
        
        [_tableFootView addSubview:lable];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(0, 0, 100, 30)];
        button.center = CGPointMake(lable.center.x, lable.center.y+35);
        [button setTitle:@"跳转练习" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor grayColor];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tableFootView addSubview:button];
    }
    return _tableFootView;
}

- (void)buttonClick:(UIButton *)btn
{
    NSLog(@"%@%ld",btn,(long)btn.tag);
    
    TestViewController *vc = [[TestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
