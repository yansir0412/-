//
//  NavgationController.m
//  管家
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "NavgationController.h"
#import "PrefixHeader.pch"

@interface NavgationController ()

@end

@implementation NavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)backButtonClick:(UIBarButtonItem *)barButtonItem
{
    [self popViewControllerAnimated:YES];
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
