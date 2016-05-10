//
//  ProtocolController.m
//  管家
//
//  Created by mac on 16/5/9.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "ProtocolController.h"
#import "PrefixHeader.pch"
#import "ProtocolCell.h"
#import "HttpRequest.h"
#import "ProtocolPurchaseModel.h"

@interface ProtocolController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *_centerButton;
    UIView *_titleView;
    UILabel *_titleLabel;
    UIImageView *_titleImageView;
    UIView *_menuView;
    BOOL _isMenuPop;
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@property (nonatomic,strong)NSArray *titleNameArray;
@end

@implementation ProtocolController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self createNavigation];
    [self createTableView];
    [self createData];
    [self createMenu];
}

- (NSArray *)titleNameArray
{
    if (_titleNameArray == nil) {
        _titleNameArray = @[@"房屋采购合同",@"租赁合同",@"预订合同"];
    }
    return _titleNameArray;
}

- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)createData
{
    [HttpRequest Get:[NSString stringWithFormat:ProtocolEnter_URL,@"WANGYAN7274"] complete:^(AFHTTPRequestOperation *operation, id reseponeObject, NSError *error) {
        
        NSArray *ary = [NSJSONSerialization JSONObjectWithData:reseponeObject options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"%@",ary);
        
    }];
}

- (void)createNavigation
{
    CGFloat width = [StringSize getWidth:self.titleNameArray[0] Size:CGSizeMake(CGFLOAT_MAX, 25) Font:22];
    NSLog(@"%@",self.titleNameArray[0]);
    _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width+20, 44)];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentRight;
    _titleLabel.text = self.titleNameArray[0];
    [_titleView addSubview:_titleLabel];
    
    _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width, 15, 20, 10)];
    _titleImageView.image = [UIImage imageNamed:@"下拉 (2)"];
    [_titleView addSubview:_titleImageView];
    self.navigationItem.titleView = _titleView;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleViewClick:)];
    [_titleView addGestureRecognizer:tapGesture];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0, 0, 20, 30);
    [searchButton setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame = CGRectMake(0, 0, 22, 22);
    [addButton setImage:[UIImage imageNamed:@"添加联系人"] forState:UIControlStateNormal];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    
    self.navigationItem.rightBarButtonItems = @[addItem,searchItem];
}

- (void)searchClick:(UIButton *)button
{
    NSLog(@"搜索");
}

- (void)addClick:(UIButton *)button
{
    NSLog(@"添加");
}

- (void)titleViewClick:(UITapGestureRecognizer *)tapGesture
{
//    _titleImageView.transform=CGAffineTransformMakeRotation(M_PI);
    [UIView animateWithDuration:0.3 animations:^{
        
        _titleImageView.transform = CGAffineTransformRotate(_titleImageView.transform, M_PI);
    }];
    _isMenuPop = !_isMenuPop;
    if (_isMenuPop) {
        [self popMenuView];
    }else{
        [self dismissMenuView];
    }
}

- (void)changeTitleName:(NSString *)titleName
{
    CGFloat width = [StringSize getWidth:titleName Size:CGSizeMake(CGFLOAT_MAX, 25) Font:22];
    _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width+20, 44)];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentRight;
    _titleLabel.text = titleName;
    [_titleView addSubview:_titleLabel];
    
    _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width, 15, 20, 10)];
    _titleImageView.image = [UIImage imageNamed:@"下拉 (2)"];
    [_titleView addSubview:_titleImageView];
    self.navigationItem.titleView = _titleView;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleViewClick:)];
    [_titleView addGestureRecognizer:tapGesture];
    
}

- (void)createMenu
{
    _menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    _menuView.backgroundColor = [UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1.0];
    _menuView.alpha = 0;
    for (int i = 0; i < self.titleNameArray.count; i++) {
        
        CGFloat h = 48;
        CGFloat w = SCREEN_WIDTH;
        CGFloat space = 2;
        CGFloat x = 0;
        CGFloat y = i*(h+space);
        
        UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [menuButton setTitle:self.titleNameArray[i] forState:UIControlStateNormal];
        [menuButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        menuButton.backgroundColor = [UIColor whiteColor];
        [menuButton addTarget:self action:@selector(selectMenu:) forControlEvents:UIControlEventTouchUpInside];
        [_menuView addSubview:menuButton];
    }
    _isMenuPop = NO;
    [self.view addSubview:_menuView];
    
}

- (void)selectMenu:(UIButton *)button
{
    [self changeTitleName:button.titleLabel.text];
    [self dismissMenuView];
    _isMenuPop = NO;
    if ([button.titleLabel.text isEqualToString:self.titleNameArray[0]]) {
        NSLog(@"select:%@",button.titleLabel.text);
    }else if ([button.titleLabel.text isEqualToString:self.titleNameArray[1]]){
        NSLog(@"select:%@",button.titleLabel.text);
    }else if ([button.titleLabel.text isEqualToString:self.titleNameArray[2]]){
        NSLog(@"select:%@",button.titleLabel.text);
    }
}

- (void)popMenuView
{
    [UIView animateWithDuration:0.3 animations:^{
        
        _menuView.alpha = 1;
        _menuView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 150);
        
    }];
}

- (void)dismissMenuView
{
    [UIView animateWithDuration:0.3 animations:^{
        _menuView.alpha = 0;
        _menuView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
        
    }];
}

#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProtocolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProtocolCell"];
    if (cell == nil) {
        cell = [[ProtocolCell alloc] init];
        CGFloat w_house = [StringSize getWidth:cell.houseNumberLabel.text Size:CGSizeMake(CGFLOAT_MAX, 17) Font:13];
        cell.houseNumberLabel.frame = CGRectMake(SCREEN_WIDTH*0.5, 8, w_house, 17);
        
        CGFloat w_time = [StringSize getWidth:cell.TimeLeftLabel.text Size:CGSizeMake(CGFLOAT_MAX, 17) Font:13];
        cell.TimeLeftLabel.frame = CGRectMake(SCREEN_WIDTH*0.5, 8, w_time, 17);
        
        CGFloat w_tel = [StringSize getWidth:cell.telLabel.text Size:CGSizeMake(CGFLOAT_MAX, 17) Font:13];
        cell.houseNumberLabel.frame = CGRectMake(SCREEN_WIDTH*0.5, 8, w_tel, 17);
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
