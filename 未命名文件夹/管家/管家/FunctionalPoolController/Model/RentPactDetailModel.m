//
//  RentPactDetailModel.m
//  管家
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "RentPactDetailModel.h"

@implementation RentPactDetailModel

- (instancetype)initWithDictionary:(NSDictionary *)item
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:item];
        
    }
    return self;
    
}

+ (instancetype)modelWithDictionary:(NSDictionary *)item
{
    return [[self alloc]initWithDictionary:item];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@",_rentNo,_startTime,_endTime,_pactNature,_period,_leaveTime,_payWay,_rentPrice,_deposit,_roomNo,_renter_name,_address,_number,_floor,_square,_houseStyle,_name,_sex,_tel,_idCard,_remark,_attrList];
}



@end
