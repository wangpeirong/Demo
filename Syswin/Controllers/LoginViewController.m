//
//  LoginViewController.m
//  Syswin
//
//  Created by wangpeirong on 15/5/28.
//  Copyright (c) 2015年 wangpeirong. All rights reserved.
//

#import "LoginViewController.h"
#import "PhoneTextView.h"
#import "MainViewController.h"
#import "ListViewController.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (nonatomic,strong)UITextField *textField;
@property (nonatomic,strong)UILabel *errorLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNaviLeftTitle:nil];
    [self setNaviBarTitle:@"登陆界面"];
    
    NSLog(@"%@",NSStringFromCGSize(self.view.bounds.size));
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake1(20, 100, 280, 40)];
    [button setBackgroundColor:RGBA(102, 176, 250, 1.0)];
    button.titleLabel.font = [UIFont systemFontOfSize:25];
    button.layer.cornerRadius = 5.0;
    button.clipsToBounds = YES;
    [button setTitle:@"toon" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    PhoneTextView *phoneTextView = [[PhoneTextView alloc]initWithFrame:CGRectMake1(20, 200, 280, 30) ];
    [self.view addSubview:phoneTextView];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake1(60, 0,  phoneTextView.frame.size.width-60-10, 30)];
    _textField
    .delegate = self;
    _textField.textAlignment = NSTextAlignmentLeft;
    _textField.placeholder = @"请在此处输入电话号码";
    _textField.clearButtonMode = UITextFieldViewModeUnlessEditing;//编辑时 出现一次删除按
    _textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;//设置键盘类型为默认
    _textField.returnKeyType = UIReturnKeyJoin;
    _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;//首字母大写
    _textField.autocorrectionType = UITextAutocorrectionTypeNo;//联想功能
    _textField.textColor = [UIColor blackColor];
    _textField.font = [UIFont systemFontOfSize:14];
    [phoneTextView addSubview:_textField];

    self.errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, 280, 15)];
    _errorLabel.textColor = RGBA(234, 55, 55, 1.0);
    _errorLabel.textAlignment = NSTextAlignmentCenter;
    self.errorLabel.text = @"输入电话号码不正确";
    self.errorLabel.hidden = YES;
    self.errorLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_errorLabel];

    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setFrame:CGRectMake1(0, 0, 80, 30)];
    [loginButton setBackgroundColor:RGB(102, 176, 250)];
//    [loginButton setBackgroundColor:[UIColor redColor]];
    
    loginButton.layer.cornerRadius = 3.0;
    loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [loginButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    loginButton.clipsToBounds = YES;
    [loginButton setTitle:@"进入" forState:UIControlStateNormal];
    CGPoint center ;
    center.x = ScreenWidth/2;
    center.y = 400;
    loginButton.center = center;
    [loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    UILabel *LineLabel = [[UILabel alloc]initWithFrame:CGRectMake1(20, 480, 280, 0.5)];
    LineLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:LineLabel];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake1(20, 485, 280, 30)];
    textLabel.text = @"北京思源置地科技有限公司";
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = RGBA(102, 176, 250, 1.0);
    textLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:textLabel];
    
        
    UIButton *creditButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [creditButton setFrame:CGRectMake1(0, 0, 80, 30)];
//    [creditButton setBackgroundColor:RGB(102, 176, 250)];
    [creditButton setBackgroundColor:[UIColor blueColor]];
    creditButton.layer.cornerRadius = 3.0;
    creditButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [creditButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    creditButton.clipsToBounds = YES;
    [creditButton setTitle:@"信誉宝" forState:UIControlStateNormal];
    center.x = ScreenWidth/2;
    center.y = 320;
    creditButton.center = center;
    [creditButton addTarget:self action:@selector(creditButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:creditButton];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loginButtonAction
{
    NSLog(@"进入");
    ListViewController *lvc = [[ListViewController alloc]init];
    [self.navigationController pushViewController:lvc animated:YES];

    
//    [self.textField resignFirstResponder];
//    
//    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//    NSLog(@"version = %@",version);
//    
//    if ([self.textField.text isEqualToString:@"15501239631"]) {
//        MainViewController *mvc = [[MainViewController alloc]init];
//        [self.navigationController pushViewController:mvc animated:YES];
//        
//    }else{
//
//        [SysPublicClass showAlerttViewWithText:@"不存在该账号" sureBlock:^(NSInteger buttonIndex) {
//            //
//        }];
//    }
}

- (void)creditButtonAction
{
    MainViewController *mvc = [[MainViewController alloc]init];
    [self.navigationController pushViewController:mvc animated:YES];
}


- (void)buttonClick
{
    NSLog(@"toon");
}
//限定只能输入11位
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.textField) {
        if (string.length>0) {
            if (textField.text.length <=10) {
                unichar c = [string characterAtIndex:0];
                if (isdigit(c)) {
                    return YES;
                }
                else
                    return NO;
            }else{
                return NO;
            }
        }
        return YES;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *phoneStr = textField.text;
    if (phoneStr.length == 0) {
        return;
    }
    
    if(![[SysPublicClass sharedInstance] validateMobile:phoneStr])
    {
        NSLog(@"%@,输入电话号码不正确",phoneStr);
        self.errorLabel.hidden = NO;
    }
    else
    {
        self.errorLabel.hidden = YES;
    }

}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.errorLabel.hidden = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textField resignFirstResponder];
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
