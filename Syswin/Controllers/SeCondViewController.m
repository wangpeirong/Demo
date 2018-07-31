//
//  SeCondViewController.m
//  Syswin
//
//  Created by 王培荣 on 2018/3/28.
//  Copyright © 2018年 wangpeirong. All rights reserved.
//

#import "SeCondViewController.h"
#import "ThirdViewController.h"

@interface SeCondViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray   *dataArray;
@property(nonatomic,strong)UITableView      *tableView;

@end

@implementation SeCondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNaviLeftTitle:@"返回"];
    [self setNaviBarTitle:@"Second ViewController"];
    
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CELL = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL];
        cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//反选
    
    UITableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
    NSString *text = cell.textLabel.text;
    NSLog(@"%@",text);
    
    if (indexPath.row == 2) {
        
        ThirdViewController *tvc = [[ThirdViewController alloc]init];
        [self.navigationController pushViewController:tvc animated:YES];
    }
}

-(UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
   
    return _tableView;
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSArray *array = [NSArray arrayWithObjects:@"猫儿",@"胖虎",@"跳转", nil];
        [_dataArray addObjectsFromArray:array];
    }
    return _dataArray;
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
