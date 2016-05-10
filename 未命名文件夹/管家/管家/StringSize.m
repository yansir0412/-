//
//  StringSize.m
//  管家
//
//  Created by mac on 16/5/9.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "StringSize.h"

@implementation StringSize

+(CGFloat)getHeight:(NSString *)str Size:(CGSize)size Font:(CGFloat)font{
    
    CGRect rect = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return rect.size.height;
}

+(CGFloat)getWidth:(NSString *)str Size:(CGSize)size Font:(CGFloat)font{
    
    CGRect rect = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return rect.size.width;
}

@end
