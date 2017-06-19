//
//  CLNetworkingConsts.h
//  CLNetworking
//
//  Created by KaKa on 2017/6/19.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#ifndef CLNetworkingConsts_h
#define CLNetworkingConsts_h

#ifdef DEBUG
#define HTTP_Log(format, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String]);
#else
#define HTTP_Log(format, ...)
#endif

#endif /* CLNetworkingConsts_h */
