//
//  ProtocolReserve_URL.m
//  管家
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "ProtocolReserveModel.h"

@implementation ProtocolReserveModel

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

@end
