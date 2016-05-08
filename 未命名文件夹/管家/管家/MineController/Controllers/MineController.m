//
//  MineController.m
//  管家
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "MineController.h"
#import "PrefixHeader.pch"
#import "MineButton.h"

@interface MineController ()
{
    UIImageView *_backgroundImageView;
    UIImageView *_headerImageView;
    UILabel *_nameLabel;
}
@property (nonatomic,strong)NSArray *nameArray;
@property (nonatomic,strong)NSArray *imageArray;
@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}

- (NSArray *)nameArray
{
    if (_nameArray == nil) {
        _nameArray = @[@"检测更新",@"修改密码",@"退出登录"];
    }
    return _nameArray;
}

- (NSArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = @[@"更新",@"修改密码",@"退出登录"];
    }
    return _imageArray;
}

- (void)createSubView
{
    _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190)];
    _backgroundImageView.image = [UIImage imageNamed:@"4"];
    [self.view addSubview:_backgroundImageView];
    
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 50)*0.5, 60, 50, 50)];
    _headerImageView.layer.cornerRadius = 25;
    _headerImageView.layer.masksToBounds = YES;
    _headerImageView.image = [UIImage imageNamed:@"联系人"];
    _headerImageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_headerImageView];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.frame = CGRectMake(0, 60 + 50 + 20, SCREEN_WIDTH, 17);
    _nameLabel.text = [NSString stringWithFormat:@"青春管家:%@",@"张三"];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_nameLabel];
    
    for (int i = 0; i < self.imageArray.count; i ++) {
        
        MineButton *button = [[MineButton alloc] initWithFrame:CGRectMake(50, 190 + 80 + i *(35 + 10), SCREEN_WIDTH - 50 * 2, 35)];
        [button setImage:[UIImage imageNamed:self.imageArray[i]] forState:UIControlStateNormal];
        [button setTitle:self.nameArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        if (i == 0) {
            
            button.backgroundColor = [UIColor colorWithRed:35/255.0f green:180/255.0f blue:58/255.0f alpha:1.0];
        }else if (i == 1){
            button.backgroundColor = [UIColor colorWithRed:245/255.0f green:59/255.0f blue:75/255.0f alpha:1.0];
        }else if (i == 2){
            button.backgroundColor = [UIColor colorWithRed:70/255.0f green:160/255.0f blue:248/255.0f alpha:1.0];
        }
    }
}

- (void)pushViewController:(MineButton *)button
{
    if ([button.titleLabel.text isEqualToString:self.nameArray[0]]) {
        NSLog(@"检测更新");
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[1]]){
        NSLog(@"修改密码");
    }else if ([button.titleLabel.text isEqualToString:self.nameArray[2]]){
        NSLog(@"退出登录");
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
