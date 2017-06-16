//
//  LCHTTPTool.h
//  kryb
//
//  Created by 凌创科技 on 2017/6/2.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LCHTTPParams.h"
#import "LCHTTPResult.h"
#import "AFNetworking.h"

#define HTTPBASEURL_Api @"http://api.litchon.com"
#define HTTPBASEURL_LocalHost @"http://192.168.0.188:8002"

@interface LCHTTPTool : NSObject

+ (AFHTTPSessionManager *)params:(LCHTTPParams *)params success:(void (^)(LCHTTPResult *result))success failure:(void (^)(NSError *error))failure;

+ (AFHTTPSessionManager *)params:(LCHTTPParams *)params resultClass:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;



@end

@interface LCHTTPTool (SimpleRequest)
+ (AFHTTPSessionManager *)simpleRequestUrl:(NSString *)urlString resultClass:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

+ (AFHTTPSessionManager *)simpleRequestUrl:(NSString *)urlString success:(void (^)(LCHTTPResult *result))success failure:(void (^)(NSError *error))failure;

@end
