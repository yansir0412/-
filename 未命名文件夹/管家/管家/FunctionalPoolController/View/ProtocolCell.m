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

- (void)setPurchaseModel:(ProtocolPurchaseModel *)purchaseModel
{
    _purchaseModel = purchaseModel;
    
    if (_purchaseModel == nil) {
        _purchaseNoLabel.text = @"null";
        _houseNumberLabel.text = @"null";
        _periodLabel.text = @"null";
        _TimeLeftLabel.text = @"null";
        _ownerNameLabel.text = @"null";
        _telLabel.text = @"null";
    }
    
    _purchaseNoLabel.text = [NSString stringWithFormat:@"合同编号:%@",purchaseModel.purchaseNo];
    _houseNumberLabel.text = [NSString stringWithFormat:@"房屋编号:%@",purchaseModel.shsNo];
    _periodLabel.text = [NSString stringWithFormat:@"合同期:%@月",purchaseModel
                         .period];
    _TimeLeftLabel.text = [NSString stringWithFormat:@"剩余时间:%@天",purchaseModel.leaveTime];
    _ownerNameLabel.text = [NSString stringWithFormat:@"合同签署人:%@",purchaseModel.ownerName];
    _telLabel.text = [NSString stringWithFormat:@"电话:%@",purchaseModel.ownerTel];
    
    
}

- (void)setRentPactModel:(ProtocolRentPactModel *)rentPactModel
{
    _rentPactModel = rentPactModel;
    
    _purchaseNoLabel.text = [NSString stringWithFormat:@"合同编号:%@",rentPactModel.rentNo];
    _houseNumberLabel.text = [NSString stringWithFormat:@"房屋编号:%@",rentPactModel.roomNo];
    _periodLabel.text = [NSString stringWithFormat:@"合同期:%@月",rentPactModel.period];
    _TimeLeftLabel.text = [NSString stringWithFormat:@"剩余时间:%@天",rentPactModel.leaveTime];
    _ownerNameLabel.text = [NSString stringWithFormat:@"合同签署人:%@",rentPactModel.rentName];
    _telLabel.text = [NSString stringWithFormat:@"电话:%@",rentPactModel.tel];
}

- (void)setReserveModel:(ProtocolReserveModel *)reserveModel
{
    _reserveModel = reserveModel;
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:[reserveModel.startTime integerValue]/1000];
    NSString *startString = [dateFormatter stringFromDate:startDate];
    
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:[reserveModel.endTime integerValue]/1000];
    NSString *endString = [dateFormatter stringFromDate:endDate];
    
    _purchaseNoLabel.text = [NSString stringWithFormat:@"合同编号:%@",reserveModel.reserveNo];
    _houseNumberLabel.text = [NSString stringWithFormat:@"房屋编号:%@",reserveModel.roomNo];
    _periodLabel.text = [NSString stringWithFormat:@"预定时间:%@",startString];
    _TimeLeftLabel.text = [NSString stringWithFormat:@"交房时间:%@",endString];
    _ownerNameLabel.text = [NSString stringWithFormat:@"合同签署人:%@",reserveModel.name];
    _telLabel.text = [NSString stringWithFormat:@"电话:%@",reserveModel.tel];
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
