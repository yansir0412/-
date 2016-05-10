//
//  ProtocolReserve_URL.h
//  管家
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProtocolReserveModel : NSObject

@property (nonatomic,copy)NSString *reserveNo;
@property (nonatomic,copy)NSString *roomNo;
@property (nonatomic,strong)NSNumber *startTime;
@property (nonatomic,strong)NSNumber *endTime;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *tel;

- (instancetype)initWithDictionary:(NSDictionary *)item;
+ (instancetype)modelWithDictionary:(NSDictionary *)item;

@end
