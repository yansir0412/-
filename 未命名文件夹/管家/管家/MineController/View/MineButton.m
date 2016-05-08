//
//  MineButton.m
//  管家
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "MineButton.h"

@implementation MineButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((contentRect.size.width - 60)*0.5, (contentRect.size.height - 15)*0.5, 60, 15);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    return CGRectMake((contentRect.size.width - 60)*0.5 - 15 - 10, (contentRect.size.height - 15)*0.5, 15, 15);
}

@end
