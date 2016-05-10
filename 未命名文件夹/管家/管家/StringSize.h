//
//  StringSize.h
//  管家
//
//  Created by mac on 16/5/9.
//  Copyright © 2016年 yanxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StringSize : NSObject

+(CGFloat)getHeight:(NSString *)str Size:(CGSize)size Font:(CGFloat)font;

+(CGFloat)getWidth:(NSString *)str Size:(CGSize)size Font:(CGFloat)font;

@end
