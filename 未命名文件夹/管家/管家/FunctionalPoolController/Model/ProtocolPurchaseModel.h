//
//  ProtocolPurchaseModel.h
//  管家
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProtocolPurchaseModel : NSObject

@property (nonatomic,copy)NSString *purchaseNo;
@property (nonatomic,copy)NSString *shsNo;
@property (nonatomic,strong)NSNumber *period;
@property (nonatomic,strong)NSNumber *leaveTime;
@property (nonatomic,copy)NSString *ownerName;
@property (nonatomic,copy)NSString *ownerTel;

- (instancetype)initWithDictionary:(NSDictionary *)item;
+ (instancetype)modelWithDictionary:(NSDictionary *)item;


@end
