//
//  CLNetworking.h
//  CLNetworking
//
//  Created by KaKa on 2017/6/19.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger {
    POST,
    GET,
} NetWorkType;

@interface CLNetworking : NSObject

/**
   网络请求

 @param url url
 @param parmeter c参数
 @param netWorkType post/get
 @param complete 完成回调
 @param fail 失败回调
 @return task
 */
+(NSURLSessionDataTask*)startNetwork:(NSString*)url
                            parmeter:(NSDictionary*)parmeter
                         netWorkType:(NetWorkType)netWorkType
                            complete:(void(^)(id obj))complete
                                fail:(void(^)(id obj))fail;

@end
