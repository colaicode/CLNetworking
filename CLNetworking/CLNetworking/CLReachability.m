//
//  CLReachability.m
//  CLNetworking
//
//  Created by KaKa on 2017/6/19.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "CLReachability.h"
#import "AFNetworking.h"
#import "CLNetworkingConsts.h"
static AFNetworkReachabilityStatus reachabilityStatus = AFNetworkReachabilityStatusReachableViaWiFi;
@implementation CLReachability
+(void)load {
    [self reachabilityNetwork];
}

+(void)reachabilityNetwork{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    //要监控网络连接状态，必须要先调用单例的startMonitoring方法
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        reachabilityStatus = status;
        HTTP_Log(@"_reachabilityStatus ==== %ld",(long)reachabilityStatus);
    }];
    
}

+(BOOL)isValidNetWork {
    return reachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi || reachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN;
}

+(BOOL)isWWAN {
    return reachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN;
}

@end
