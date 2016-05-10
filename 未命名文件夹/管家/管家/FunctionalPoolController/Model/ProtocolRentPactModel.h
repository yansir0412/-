//
//  ProtocolRentPactModel.h
//  管家
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProtocolRentPactModel : NSObject

@property (nonatomic,copy)NSString *rentNo;
@property (nonatomic,copy)NSString *roomNo;
@property (nonatomic,strong)NSNumber *period;
@property (nonatomic,strong)NSNumber *leaveTime;
@property (nonatomic,copy)NSString *rentName;
@property (nonatomic,copy)NSString *tel;

- (instancetype)initWithDictionary:(NSDictionary *)item;
+ (instancetype)modelWithDictionary:(NSDictionary *)item;


@end
