//
//  ProtocolPurchaseModel.m
//  管家
//
//  Created by mac on 16/5/10.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "ProtocolPurchaseModel.h"

@implementation ProtocolPurchaseModel

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
