//
//  CLNetworking.m
//  CLNetworking
//
//  Created by KaKa on 2017/6/19.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "CLNetworking.h"
#import "AFNetworking.h"
#import "CLNetworkingConsts.h"
#import "CLReachability.h"
@implementation CLNetworking

+(NSURLSessionDataTask *)startNetwork:(NSString *)url parmeter:(NSDictionary *)parmeter netWorkType:(NetWorkType)netWorkType complete:(void (^)(id))complete fail:(void (^)(id))fail {
    if (![CLReachability isValidNetWork]) {
        if(fail) fail(nil);
        return nil;
    }
    if (netWorkType == GET) {
        return [self get:url parmeter:parmeter complete:complete fail:fail];
    } else {
        return [self post:url parmeter:parmeter complete:complete fail:fail];
    }
}

+(NSURLSessionDataTask*)post:(NSString *)url parmeter:(NSDictionary *)parmeter complete:(void (^)(id))complete fail:(void (^)(id))fail
{
    return [[self sessionManager] POST:[self urlToUTF8:url] parameters:parmeter progress:^(NSProgress* progress){
    } success:^(NSURLSessionDataTask * __unused task, id responseObj){
        complete(responseObj);
        HTTP_Log(@"%@",responseObj);
    } failure:^(NSURLSessionDataTask * __unused task, NSError* error){
        HTTP_Log(@"error === %@",error);
        if(fail) fail(error);
    }];
}

#pragma mark --------------- get ---------------
+(NSURLSessionDataTask *)get:(NSString *)url parmeter:(id)parmeter complete:(void(^)(id obj))complete fail:(void(^)(id failError))fail {
    return [[self sessionManager] GET:[[self class] string] parameters:parmeter progress:^(NSProgress* progress){
    } success:^(NSURLSessionDataTask * __unused task, id responseObj){
        complete(responseObj);
        HTTP_Log(@"%@",responseObj);
    } failure:^(NSURLSessionDataTask * __unused task, NSError* error){
        if(fail) fail(error);
        HTTP_Log(@"error ======  %@",error);
    }];
    
}

+(AFHTTPSessionManager*)sessionManager
{
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    AFJSONResponseSerializer*  responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = YES;
    manager.responseSerializer = responseSerializer;
    manager.requestSerializer.timeoutInterval = 30;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"application/json",
                                                         @"text/json",
                                                         @"text/javascript",
                                                         @"text/html",
                                                         @"text/plain", nil];
    return manager;
}

+(NSString *)urlToUTF8:(NSString*)url
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)url,NULL,NULL,kCFStringEncodingUTF8));
    return result;
}


@end
