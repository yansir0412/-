//
//  HomeViewCell_6p.m
//  管家
//
//  Created by mac on 16/5/9.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "HomeViewCell_6p.h"

@implementation HomeViewCell_6p

- (instancetype)init{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"HomeViewCell_6p" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
