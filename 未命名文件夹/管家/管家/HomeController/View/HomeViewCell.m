//
//  HomeViewCell.m
//  管家
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "HomeViewCell.h"

@implementation HomeViewCell

- (instancetype)init
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HomeViewCell" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
