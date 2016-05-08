//
//  HttpRequest.h
//  LOL
//
//  Created by 刘清 on 16/3/9.
//  Copyright (c) 2016年 LQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperationManager.h>

//网络请求完成后回调的Block（包括成功、失败）
typedef void (^CompleteBlock)(AFHTTPRequestOperation *operation, id reseponeObject, NSError *error);

@interface HttpRequest : NSObject

/**
 *  发起Get方式的Http请求
 *
 *  @param url      统一资源定位符
 *  @param complete 请求完成后的回调
 */
+ (void)Get:(NSString *)url complete:(CompleteBlock)complete;

@end
