//
//  ContactsModel.m
//  管家
//
//  Created by mac on 16/5/5.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import "ContactsModel.h"
#import <PinYin4Objc.h>
#import "PinYinForObjc.h"

@implementation ContactsModel

- (instancetype)initWithDictionary:(NSDictionary *)item
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:item];
        _header = [NSString stringWithFormat:@"%c",[[PinYinForObjc chineseConvertToPinYin:_name] characterAtIndex:0]];
    }
    return self;
    
}

+ (instancetype)listWithDictionary:(NSDictionary *)item
{
    return [[self alloc]initWithDictionary:item];
}



- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
