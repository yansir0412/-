//
//  RentPactDetailCell.m
//  管家
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "RentPactDetailCell.h"
#import "PrefixHeader.pch"
#import <UIImageView+WebCache.h>

@implementation RentPactDetailCell

- (instancetype)init
{
    return [[[NSBundle mainBundle] loadNibNamed:@"RentPactDetailCell" owner:nil options:nil] lastObject];
}

- (NSArray *)sexArray
{
    if (_sexArray == nil) {
        _sexArray = @[@"女",@"男"];
    }
    return _sexArray;
}

- (void)setModel:(RentPactDetailModel *)model
{
    _model = model;
    _rentNoLabel.text = [NSString stringWithFormat:@"合同编号：%@",model.rentNo];
    _startTimeLabel.text = [NSString stringWithFormat:@"开始时间：%@",model.startTime];
    _endTimeLabel.text = [NSString stringWithFormat:@"到期时间：%@",model.endTime];
    _pactNatureLabel.text = [NSString stringWithFormat:@"合同性质：%@",model.pactNature];
    _periodLabel.text = [NSString stringWithFormat:@"合同期限：%@月",model.period];
    _leaveTimeLabel.text = [NSString stringWithFormat:@"剩余时间：%@天",model.leaveTime];
    _payWayLabel.text = [NSString stringWithFormat:@"收费方式：%@",model.payWay];
    _rentPriceLabel.text = [NSString stringWithFormat:@"价格：%@元/月",model.rentPrice];
    _depositLabel.text = [NSString stringWithFormat:@"押金：%@元",model.deposit];
    _roomNoLabel.text = [NSString stringWithFormat:@"房间编号：%@",model.roomNo];
    _nameLabel.text = [NSString stringWithFormat:@"房间名称：%@",model.name];
    _addressLabel.text = [NSString stringWithFormat:@"物业地址：%@",model.address];
    _numberLabel.text = [NSString stringWithFormat:@"房间号：%@",model.number];
    _floorLabel.text = [NSString stringWithFormat:@"楼层：%@",model.floor];
    _squareLabel.text = [NSString stringWithFormat:@"面积：%@㎡",model.square];
    _houseStyleLabel.text = [NSString stringWithFormat:@"户型：%@",model.houseStyle];
    _renter_nameLabel.text = [NSString stringWithFormat:@"租客姓名：%@",model.renter_name];
    ;
    _sexLabel.text = [NSString stringWithFormat:@"性别：%@",self.sexArray[[model.sex intValue]]];
    _telLabel.text = [NSString stringWithFormat:@"手机号：%@",model.tel];
    _idCardLabel.text = [NSString stringWithFormat:@"身份证号：%@",model.idCard];
    _remarkLabel.text = [NSString stringWithFormat:@"备注：%@",model.remark];
    [_attrImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:ProtocolRentImageUrl,[model.attrList lastObject]]]];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
