//
//  LCHTTPBaseTool.m
//  kryb
//
//  Created by 凌创科技 on 2017/6/2.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import "LCHTTPBaseTool.h"

@implementation LCHTTPBaseTool
+ (AFHTTPSessionManager *)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure;
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    NSDictionary *paramsDict = params;
    
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript", nil];
    mgr.responseSerializer = serializer;

    // 2.发送POST请求
    [mgr POST:url parameters:paramsDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dict = responseObject;
        
        if (success) {
            success(dict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
    return mgr;
}
@end
