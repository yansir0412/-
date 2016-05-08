//
//  Home_FunctionButton.m
//  管家
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "Home_FunctionButton.h"

#define Ratio 0.8
#define IMAGE_RATIO 0.8

@implementation Home_FunctionButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    return CGRectMake(0, contentRect.size.height * Ratio, contentRect.size.width, contentRect.size.height * (1-Ratio));
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(contentRect.size.width * (1 -IMAGE_RATIO) * 0.5, 0, contentRect.size.width * IMAGE_RATIO, contentRect.size.height * Ratio * IMAGE_RATIO);
}


@end
