//
//  HttpRequest.m
//  LOL
//
//  Created by 刘清 on 16/3/9.
//  Copyright (c) 2016年 LQ. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

+ (void)Get:(NSString *)url complete:(CompleteBlock)complete
{
    //1 创建一个AFHTTPRequestOperationManager对象
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    //  设置各种属性（返回数据的类型、content-type）
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    //二进制
    //manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    //JSON
    //manger.responseSerializer = [AFJSONResponseSerializer serializer];
    //XML
    //manger.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    //2 调用GetXXX发起Get方式网络请求
    [manger GET:url
     parameters:nil
        success:^(AFHTTPRequestOperation * operation, id responeObject) {
            
            //调用Block
            complete(operation, responeObject, nil);
            
        }
        failure:^(AFHTTPRequestOperation * operation, NSError * error) {
            
            complete(operation, nil, error);
            
        }];
}

@end
