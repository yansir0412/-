//
//  ProtocolCell.h
//  管家
//
//  Created by mac on 16/5/9.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProtocolPurchaseModel.h"
#import "ProtocolRentPactModel.h"
#import "ProtocolReserveModel.h"

@interface ProtocolCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *houseNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimeLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *purchaseNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodLabel;
@property (weak, nonatomic) IBOutlet UILabel *ownerNameLabel;

@property (nonatomic,strong)ProtocolPurchaseModel *purchaseModel;
@property (nonatomic,strong)ProtocolRentPactModel *rentPactModel;
@property (nonatomic,strong)ProtocolReserveModel *reserveModel;

@end
