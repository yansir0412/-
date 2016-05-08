//
//  ContactsModel.h
//  管家
//
//  Created by mac on 16/5/5.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactsModel : NSObject

@property (nonatomic,copy)NSString *pin;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *tel;
@property (nonatomic,copy)NSString *header;
@property (nonatomic,copy)NSString *deptName;

- (instancetype)initWithDictionary:(NSDictionary *)item;
+ (instancetype)listWithDictionary:(NSDictionary *)item;



@end
