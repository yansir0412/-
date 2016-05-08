//
//  FunctionalPoolController.m
//  管家
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "FunctionalPoolController.h"
#import "FunctionalButton.h"
#import "PrefixHeader.pch"

#import "ContactsController.h"



@interface FunctionalPoolController ()
{
    UILabel *_nameLabel;
    UIButton *_messageButton;
}

@property (nonatomic,strong)NSArray *nameArray;
@property (nonatomic,strong)NSArray *imageArray;

@end

@implementation FunctionalPoolController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //测试
    self.title = @"张三";
    [self createNavigationBar];
    [self createSubViews];
    
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

- (NSArray *)nameArray
{
    if (_nameArray == nil) {
        _nameArray = @[@"通讯录",@"合同查询",@"房屋查询",@"工单管理",@"扫一扫",@"智能锁",@"房租催缴",@"评价",@"备忘录"];
    }
    return _nameArray;
}

- (NSArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = @[@"通讯录",@"合同管理",@"房屋管理",@"工单管理",@"扫一扫 (2)",@"智能锁",@"房租催缴",@"评价",@"备忘录"];
    }
    return _imageArray;
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
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"";
    
    self.navigationItem.backBarButtonItem = backButtonItem;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)pushMessageController
{
    NSLog(@"Push");
}



- (void)createSubViews
{
    CGFloat space_x = SCREEN_WIDTH * 0.18;
    CGFloat space_y = 30;
    CGFloat height = SCREEN_HEIGHT * 0.12;
    CGFloat widht = height * 0.8;
    int row = 3;
    
    for (int i = 0; i < self.nameArray.count; i++) {
        
        CGFloat index_line = i % row;
        CGFloat index_row = i / row;
        CGFloat x_first = (SCREEN_WIDTH - widht*row - space_x * (row - 1))*0.5;
        CGFloat x_normal = x_first + index_line * (widht + space_x);
        CGFloat y_normal = 50 + index_row * (height + space_y);
        
        if (index_line == 0) {
            FunctionalButton *button = [[FunctionalButton alloc] initWithFrame:CGRectMake(x_first, y_normal, widht, height)];
            [button setImage:[UIImage imageNamed:self.imageArray[i]] forState:UIControlStateNormal];
            [button setTitle:self.nameArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            button.titleLabel.font = [UIFont systemFontOfSize:12];
            button.tag = 100 + i;
            [button addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:button];
        }else{
            FunctionalButton *button = [[FunctionalButton alloc] initWithFrame:CGRectMake(x_normal, y_normal, widht, height)];
            [button setImage:[UIImage imageNamed:self.imageArray[i]] forState:UIControlStateNormal];
            [button setTitle:self.nameArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            button.titleLabel.font = [UIFont systemFontOfSize:12];
            button.tag = 100 + i;
            [button addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:button];
            
            
            
        }
        
    }
    
}

- (void)pushViewController:(FunctionalButton *)button
{
    if ([button.titleLabel.text isEqualToString:self.nameArray[0]]) {
        
        ContactsController *contactsController = [[ContactsController alloc] init];
        [self.navigationController pushViewController:contactsController animated:YES];
        
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[1]])
    {
        NSLog(@"1");
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[2]])
    {
        NSLog(@"2");
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[3]])
    {
        NSLog(@"3");
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[4]])
    {
        NSLog(@"4");
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[5]])
    {
        NSLog(@"5");
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[6]])
    {
        NSLog(@"6");
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[7]])
    {
        NSLog(@"7");
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[8]])
    {
        NSLog(@"8");
    }
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
