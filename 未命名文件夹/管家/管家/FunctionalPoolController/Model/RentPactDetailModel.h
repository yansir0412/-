//
//  RentPactDetailModel.h
//  管家
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RentPactDetailModel : NSObject

@property (nonatomic,copy)NSString *rentNo;
@property (nonatomic,strong)NSNumber *startTime;
@property (nonatomic,strong)NSNumber *endTime;
@property (nonatomic,copy)NSNumber *pactNature;
@property (nonatomic,strong)NSNumber *period;
@property (nonatomic,strong)NSNumber *leaveTime;
@property (nonatomic,copy)NSString *payWay;
@property (nonatomic,strong)NSNumber *rentPrice;
@property (nonatomic,strong)NSNumber *deposit;
@property (nonatomic,copy)NSString *roomNo;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *address;
@property (nonatomic,copy)NSString *number;
@property (nonatomic,strong)NSNumber *floor;
@property (nonatomic,copy)NSNumber *square;
@property (nonatomic,copy)NSString *houseStyle;
@property (nonatomic,copy)NSString *renter_name;
@property (nonatomic,strong)NSNumber *sex;
@property (nonatomic,copy)NSString *tel;
@property (nonatomic,copy)NSString *idCard;
@property (nonatomic,copy)NSString *remark;
@property (nonatomic,strong)NSArray *attrList;

- (instancetype)initWithDictionary:(NSDictionary *)item;
+ (instancetype)modelWithDictionary:(NSDictionary *)item;


@end
