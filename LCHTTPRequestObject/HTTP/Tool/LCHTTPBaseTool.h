//
//  LCHTTPBaseTool.h
//  kryb
//
//  Created by 凌创科技 on 2017/6/2.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface LCHTTPBaseTool : NSObject
+ (AFHTTPSessionManager *)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure;

@end
