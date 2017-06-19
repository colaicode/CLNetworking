//
//  CLReachability.h
//  CLNetworking
//
//  Created by KaKa on 2017/6/19.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLReachability : NSObject
/**
 *  网络检测
 *
 *  @return YES：有网，NO：没网
 */
+(BOOL)isValidNetWork;
/**
 *  3G网络监测
 *
 *  @return YES：3G
 */
+(BOOL)isWWAN;

@end
