//
//  RunTimeViewController.m
//  Syswin
//
//  Created by 王培荣 on 2018/7/30.
//  Copyright © 2018年 wangpeirong. All rights reserved.
//

#import "RunTimeViewController.h"
#import "UIImage+MyImage.h"
#import "NSString+MySrting.h"
#import "NSObject+Property.h"

@interface RunTimeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray   *dataArray;
@property(nonatomic,strong)UITableView      *tableView;

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNaviBarTitle:@"RunTime"];
    [self setNaviLeftTitle:@"返回"];
    
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDataSource

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CELL =@"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL];
        cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%@",[self.dataArray objectAtIndex:indexPath.row]);
    
    if (indexPath.row == 0) {//动态交换俩方法的实现
        
        UIImage *image = [UIImage imageNamed:@"hehe"];
//        UIImage *image = [UIImage my_imageNamed:@"hehe"];

        
    }else if (indexPath.row == 1){
        
        NSString *dinner = @"醋熘白菜加红烧牛肉面";
        dinner.name = @"好饭";
        
        NSLog(@"name = %@",dinner.name);
        NSLog(@"nickName = %@",dinner.nickName);
        
        NSObject *objc = [[NSObject alloc]init];
        objc.name = @"动态添加属性";
        NSLog(@"name = %@",objc.name);
        
    }else if (indexPath.row == 2){
        
        
    }
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithObjects:@"交换俩个方法的实现",@"给分类添加属性",@"字典转模型",@"动态添加方法",@"拦截并替换方法",@"实现NSCoding的自动归档和解档", nil];
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
