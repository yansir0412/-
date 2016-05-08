//
//  ContactsController.m
//  管家
//
//  Created by mac on 16/5/5.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "ContactsController.h"
#import "PrefixHeader.pch"
#import "HttpRequest.h"
#import "ContactsController.h"
#import "tidyModel.h"
#import "ContactsModel.h"
#import <AFNetworking.h>

@interface ContactsController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchBarDelegate,UISearchControllerDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSMutableArray *_tidyArray;
    UIView *_searchBar;
    UISearchController *_searchController;
    NSMutableArray *_seatchResultArray;
}

@end

@implementation ContactsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"通讯录";
    
    _dataArray = [[NSMutableArray alloc] init];
    _tidyArray = [[NSMutableArray alloc] init];
    
    NSArray *headerArray = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    
    for (int i = 0; i < headerArray.count; i++) {
        
        tidyModel *model = [[tidyModel alloc] init];
        
        model.header = headerArray[i];
        model.listArray = [[NSMutableArray alloc] init];
        [_tidyArray addObject:model];
        
    }
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createData];
    [self createSubView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)createData
{
 
    [HttpRequest Get:CONTACTS_URL complete:^(AFHTTPRequestOperation *operation, id reseponeObject, NSError *error) {
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:reseponeObject options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary *dic in array) {
            
            ContactsModel *model = [ContactsModel listWithDictionary:dic];
            [_dataArray addObject:model];
            NSLog(@"%@",model.header);
        }
        
        [self tidyData];
        [_tableView reloadData];
    }];
    
}

- (void)tidyData
{
    for (ContactsModel *model in _dataArray) {
        
        NSString *header = model.header;
        for (tidyModel *tidy in _tidyArray) {
            if ([tidy.header isEqualToString:header]) {
                
                [tidy.listArray addObject:model];
                
            }
        }
    }
    
    for (int i = 0; i < _tidyArray.count; i++) {
        
        tidyModel *model = _tidyArray[i];
        
        if (model.listArray.count <=0) {
            
            [_tidyArray removeObject:model];
            i--;
        }
        
    }
    

}

- (void)createSubView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_tableView];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.dimsBackgroundDuringPresentation = NO;
//    _searchController.hidesNavigationBarDuringPresentation = YES;
    
    _searchController.searchBar.placeholder = @"请输入查找内容";
    
    _searchController.searchResultsUpdater = self;
    _searchController.searchBar.delegate = self;
    _searchController.delegate = self;
    [_searchController.searchBar sizeToFit];
        _searchController.searchBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
        [self.view addSubview:_searchController.searchBar];
    
//    _tableView.tableHeaderView = _searchController.searchBar;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        return _searchController.active? 1 : _tidyArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        tidyModel *model = _tidyArray[section];
        return _searchController.active? _seatchResultArray.count : model.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"CONTACTSCELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    if (_searchController.active) {
        
        ContactsModel *seatchModel = _seatchResultArray[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",seatchModel.name,seatchModel.deptName];
    }else{
        
        tidyModel *tidy = _tidyArray[indexPath.section];
        ContactsModel *model= tidy.listArray[indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",model.name,model.deptName];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 15)];
    view.backgroundColor = [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 15, 15)];
    [view addSubview:headerLabel];
    
    ContactsModel *model = _tidyArray[section];
    headerLabel.text = model.header;
    headerLabel.textColor = [UIColor colorWithRed:49/255.0f green:120/255.0f blue:253/255.0f alpha:1.0];
    headerLabel.font = [UIFont systemFontOfSize:13];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return _searchController.active? 0: 15;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tidyModel *tidyModel = _tidyArray[indexPath.section];
    ContactsModel *contactsModel = tidyModel.listArray[indexPath.row];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@",contactsModel.name] message:[NSString stringWithFormat:@"%@",contactsModel.tel] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *callAction = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",contactsModel.tel];
        UIWebView * callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:callAction];
    
    [self presentViewController:alertController animated:NO completion:nil];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (ContactsModel *model in _tidyArray) {
        
        [array addObject:model.header];
        
    }
    return array;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS [c]%@",searchController.searchBar.text];
    
    if (_seatchResultArray) {
        _seatchResultArray = nil;
    }
    
    
    _seatchResultArray = [NSMutableArray arrayWithArray:[_dataArray filteredArrayUsingPredicate:predicate]];
    
    [_tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
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
