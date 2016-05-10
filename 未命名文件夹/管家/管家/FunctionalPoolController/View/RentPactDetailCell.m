//
//  RentPactDetailCell.m
//  管家
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "RentPactDetailCell.h"

@implementation RentPactDetailCell

- (instancetype)init
{
    return [[[NSBundle mainBundle] loadNibNamed:@"RentPactDetailCell" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
