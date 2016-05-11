//
//  RentPactDetailCell.h
//  管家
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "RentPactDetailModel.h"

@interface RentPactDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *rentNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pactNatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodLabel;
@property (weak, nonatomic) IBOutlet UILabel *leaveTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *payWayLabel;
@property (weak, nonatomic) IBOutlet UILabel *rentPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *depositLabel;
@property (weak, nonatomic) IBOutlet UILabel *roomNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *floorLabel;
@property (weak, nonatomic) IBOutlet UILabel *squareLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseStyleLabel;
@property (weak, nonatomic) IBOutlet UILabel *renter_nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *idCardLabel;
@property (weak, nonatomic) IBOutlet UILabel *remarkLabel;
@property (weak, nonatomic) IBOutlet UIImageView *attrImageView;

@property (nonatomic,strong)RentPactDetailModel *model;
@property (nonatomic,strong)NSArray *sexArray;

@end
