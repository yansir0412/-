//
//  MainTabBarController.m
//  管家
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "MainTabBarController.h"
#import "NavgationController.h"
#import "FunctionalPoolController.h"
#import "HomeController.h"
#import "MineController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubControllers];
}

- (void)createSubControllers
{
    HomeController *homeController = [[HomeController alloc] init];
    NavgationController *home_NavgationController = [[NavgationController alloc] initWithRootViewController:homeController];
    home_NavgationController.title = @"首页";
    
    FunctionalPoolController *functionalController = [[FunctionalPoolController alloc] init];
    NavgationController *functional_NavgationController = [[NavgationController alloc] initWithRootViewController:functionalController];
    functional_NavgationController.title = @"功能池";
    
    MineController *mineController = [[MineController alloc] init];
    NavgationController *mine_NavgationController = [[NavgationController alloc] initWithRootViewController:mineController];
    mine_NavgationController.title = @"我的";
    
    self.viewControllers = @[home_NavgationController,functional_NavgationController,mine_NavgationController];
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
