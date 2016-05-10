//
//  ProtocolCell.m
//  管家
//
//  Created by mac on 16/5/9.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "ProtocolCell.h"
#import "PrefixHeader.pch"

@implementation ProtocolCell

- (instancetype)init
{
    
    
    return [[[NSBundle mainBundle] loadNibNamed:@"ProtocolCell" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    CGFloat w_house = [StringSize getWidth:_houseNumberLabel.text Size:CGSizeMake(CGFLOAT_MAX, 17) Font:13];
    _houseNumberLabel.frame = CGRectMake(SCREEN_WIDTH*0.5, 8, w_house, 17);
    
    CGFloat w_time = [StringSize getWidth:_TimeLeftLabel.text Size:CGSizeMake(CGFLOAT_MAX, 17) Font:13];
    _TimeLeftLabel.frame = CGRectMake(SCREEN_WIDTH*0.5, 8, w_time, 17);
    
    CGFloat w_tel = [StringSize getWidth:_telLabel.text Size:CGSizeMake(CGFLOAT_MAX, 17) Font:13];
    _houseNumberLabel.frame = CGRectMake(SCREEN_WIDTH*0.5, 8, w_tel, 17);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
