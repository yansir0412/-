//
//  HomeController.m
//  管家
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "HomeController.h"
#import "PrefixHeader.pch"
//#import "Home_FunctionButton.h"
#import "HomeViewCell.h"

@interface HomeController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    UILabel *_nameLabel;
    UIButton *_messageButton;
}
@property (nonatomic,strong)NSArray *functionNameArray;
@property (nonatomic,strong)NSArray *functionImageArray;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createTableView];
    [self createNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _nameLabel.hidden = NO;
    _messageButton.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _nameLabel.hidden = YES;
    _messageButton.hidden = YES;
}


- (NSArray *)functionNameArray
{
    if (_functionNameArray == nil) {
        _functionNameArray = @[@"通讯录",@"合同管理",@"房间查询",@"扫一扫"];
    }
    return _functionNameArray;
}

- (NSArray *)functionImageArray
{
    if (_functionImageArray == nil) {
        _functionImageArray = @[@"通讯录",@"合同管理",@"房屋管理",@"扫一扫"];
    }
    return _functionImageArray;
}



- (void)createNavigationBar
{
    //NavgationBar左标签
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 14, 45, 16)];
    _nameLabel.text = @"管家";
    _nameLabel.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:_nameLabel];
    
    //NavgationBar右按钮
    _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _messageButton.frame = CGRectMake(SCREEN_WIDTH - 35, 14, 17, 17);
    [_messageButton setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:_messageButton];
    [_messageButton addTarget:self action:@selector(pushMessageController) forControlEvents:UIControlEventTouchUpInside];
    
    //修改NavgationBar上字体颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    //设置NavgationBar背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"2"] forBarMetrics:UIBarMetricsDefault];
    
    
}

- (void)pushMessageController
{
    NSLog(@"Push");
}


- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewCell *cell = [[HomeViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _tableView.frame.size.height;
}

//- (void)createSubView
//{
//    //消息
//    _messageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (self.view.frame.size.height-64-49) * 0.96 * 0.5)];
//    _messageView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:_messageView];
//    
//    //代办
//    _agencyView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_messageView.frame) + (self.view.frame.size.height-64-49) * 0.02, SCREEN_WIDTH, ((self.view.frame.size.height-64-49) * 0.96 * 0.3))];
//    _agencyView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:_agencyView];
//    
//    //功能
//    _functionView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_agencyView.frame) + (self.view.frame.size.height-64-49) * 0.02, SCREEN_WIDTH, ((self.view.frame.size.height-64-49) * 0.96 * 0.2))];
//    _functionView.backgroundColor = [UIColor whiteColor];
//    
//    for (int i = 0; i < self.functionNameArray.count; i++) {
//        
//        CGFloat button_y = _functionView.frame.size.height * 0.1;
//        CGFloat button_h = _functionView.frame.size.height * 0.9;
//        CGFloat button_w = button_h * 0.8;
//        CGFloat button_space = (SCREEN_WIDTH - button_w * self.functionImageArray.count)/(self.functionImageArray.count - 1);
////        CGFloat button_x = ;
////        
////        Home_FunctionButton *functionButton = [[UIButton alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]
//        
//    }
//    
//    [self.view addSubview:_functionView];
//}


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
