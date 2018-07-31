//
//  ListViewController.m
//  Syswin
//
//  Created by 王培荣 on 2017/3/23.
//  Copyright © 2017年 wangpeirong. All rights reserved.
//

#import "ListViewController.h"
#import "SeCondViewController.h"
#import "RunTimeViewController.h"
#import "Arithmetic.h"
#import "SimpleInstance.h"

//#import <JavaScriptCore/JavaScriptCore.h>


@interface ListViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong)    NSString *sStr;
@property (nonatomic,copy  )    NSString *cStr;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNaviLeftBarStyle:kBarStyleBack];
    [self setNaviBarTitle:@"功能列表页"];
    
    [self.view addSubview:self.tableView];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //更新主线程
        });
        
        
    });
    
    
    
    // Do any additional setup after loading the view.
}
#pragma mark - delegate

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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.row == 1) {//算法排序
        
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@9,@2,@10,@7,@3,@7,@4,nil];
        
        printf("排序前:");
        [Arithmetic printArray:array];
        
        //快速排序
//            [Arithmetic quickSort:array low:0 high:6];
        //冒泡排序
//            [Arithmetic buddleSort:array];
        //选择排序
//            [Arithmetic selectSort:array];
        //插入排序
        [Arithmetic inserSort:array];
        
        printf("排序后:");
        [Arithmetic printArray:array];

    }else if (indexPath.row == 2){
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setInteger:100 forKey:@"wangxiaoxia"];
        [userDefault synchronize];
    }else if (indexPath.row == 3){
        
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *path = [paths objectAtIndex:0];
//        NSLog(@"path: %@", path);
//        
//        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//        NSInteger data1 = [userDefault integerForKey:@"wangxiaoxia"];
//        NSLog(@"%ld",data1);

        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        NSLog(@"path: %@", docPath);

        NSString *myFile = [docPath stringByAppendingPathComponent:@"test.plist"];
    
        NSArray *array = @[@"123", @"456", @"789"];
        [array writeToFile:myFile atomically:YES];
        
        
    }else if (indexPath.row == 4){
        
        NSLog(@"跳转到粒子效果页面");
        
        
        
    }else if (indexPath.row == 5){//深拷贝与浅拷贝相关
        
        NSMutableString *mStr = [NSMutableString stringWithFormat:@"abc"];
        
        self.sStr = mStr;
        self.cStr = mStr;
        
        NSLog(@"mStr:%p,%@",  mStr,mStr);
        NSLog(@"strongStr:%p,%@", _sStr, _sStr);
        NSLog(@"copyStr:%p,%@",   _cStr, _cStr);
        
        
        NSLog(@"\n---------------------\n");
        [mStr appendString:@"hello"];
        
        NSLog(@"mStr:%p,%@",  mStr,mStr);
        NSLog(@"strongStr:%p,%@", _sStr, _sStr);
        NSLog(@"copyStr:%p,%@",   _cStr, _cStr);
        
        
        //    NSString *stringA ;
        //    NSMutableString *sourceStr = @"hehe";
        //
        //    stringA = sourceStr;
        //    NSLog(@"stringA = %@,sourceString = %@",stringA,sourceStr);
        //
        //    sourceStr = @"hello world";
        //
        //    NSLog(@"stringA = %@,sourceString = %@",stringA,sourceStr);
        
    }else if (indexPath.row == 6){//单利
        
        SimpleInstance *instance1 = [SimpleInstance shareInstance];
        SimpleInstance *instance2 = [SimpleInstance shareInstance];
        
        SimpleInstance *instance3 = [[SimpleInstance alloc]init];
        
        NSLog(@"instance1:%@  %p",instance1,&instance1);
        NSLog(@"instance2:%@  %p",instance2,&instance2);
        NSLog(@"instance3:%@  %p",instance3,&instance3);
        
        
        /* 可看出多个指针同时指向一个实例 */
        
    }else if (indexPath.row == 7){
        
        //runtime
        RunTimeViewController *rvc = [[RunTimeViewController alloc]init];
        [self.navigationController pushViewController:rvc animated:YES];
        
    }
    else if (indexPath.row == 8){
        
        NSLog(@"练习");
        
        SeCondViewController *sVC = [[SeCondViewController alloc]init];
        [self.navigationController pushViewController:sVC animated:YES];
    }
    
    
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
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
        
        NSArray *array = @[@"多线程",@"排序",@"存数据",@"取数据",@"粒子效果",@"深浅拷贝",@"单利",@"RunTime",@"练习"];
        
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
