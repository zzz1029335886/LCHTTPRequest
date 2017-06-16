
//
//  LCHTTPTool.m
//  kryb
//
//  Created by 凌创科技 on 2017/6/2.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import "LCHTTPTool.h"
#import "LCHTTPBaseTool.h"
#import "MJExtension.h"

#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

@implementation LCHTTPTool

static NSString *_lastShortUrlString;

+ (AFHTTPSessionManager *)params:(LCHTTPParams *)params success:(void (^)(LCHTTPResult *result))success failure:(void (^)(NSError *error))failure;
{
    NSString *url;
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"localHost"]){
        url = [NSString stringWithFormat:@"%@/%@",HTTPBASEURL_LocalHost,params.shortUrlString];
    }else{
        url = [NSString stringWithFormat:@"%@/%@",HTTPBASEURL_Api,params.shortUrlString];
    }
    
//    params.shortUrlString = nil;
    
    NSMutableDictionary *dict = [params mj_keyValues];
    
    if(params.page == 0){
        [dict removeObjectForKey:@"page"];
    }
    
    if(params.size == 0){
        [dict removeObjectForKey:@"size"];
    }
    
    [dict removeObjectForKey:@"dict"];
    [dict addEntriesFromDictionary:params.dict];
    
    [dict removeObjectForKey:@"alert"];
    [dict removeObjectForKey:@"intercept"];
    [dict removeObjectForKey:@"shortUrlString"];

    return [LCHTTPBaseTool post:url params:dict success:^(id response) {
        
        LCHTTPResult *result = [LCHTTPResult mj_objectWithKeyValues:response];
        if (success) {
            if(result.code == 1){
                success(result);
            }else{
                if(result.code == -1 && [LCUserInfoResult getLoginKeyString]){
                    
                    LCHTTPParams *autoLoginParams = [LCHTTPParams paramsWithShortUrlStr:@"User/Account/AutoLogin"];
                    autoLoginParams.dict[@"keyString"] = [LCUserInfoResult getLoginKeyString];
                    
                    [LCHTTPTool params:autoLoginParams resultClass:[LCUserInfoResult class] success:^(LCHTTPResult *autoResult) {
                        
                        if(autoResult.code == 1){
                            [self params:params success:success failure:failure];
                        }
                        
                    } failure:^(NSError *autoError) {
                        if(failure){
                            failure(autoError);
                        }
                    }];
                    
                }else{
                    if(!params.intercept){
                        success(result);
                    }else{
                        if(params.alert){
                            dispatch_main_sync_safe(^{
                                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:result.msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                                [alertView show];
                            });
                        }else{
                            dispatch_main_sync_safe(^{
                                [MBProgressHUD showError:result.msg];
                            });
                        }
                    }
                }
            }
        }
        
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}

+ (AFHTTPSessionManager *)params:(LCHTTPParams *)params resultClass:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
{
    return [self params:params success:^(LCHTTPResult *result) {
        
        if(success){
            LCHTTPResult *classResult = [resultClass mj_objectWithKeyValues:result.resp];
            classResult.code = result.code;
            classResult.msg = result.msg;
            success(classResult);
        }
        
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}
@end


@implementation LCHTTPTool (SimpleRequest)

+ (AFHTTPSessionManager *)simpleRequestUrl:(NSString *)urlString resultClass:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
{
    LCHTTPParams *params = [LCHTTPParams paramsWithShortUrlStr:urlString];
    return [self params:params resultClass:resultClass success:success failure:failure];
    
}

+ (AFHTTPSessionManager *)simpleRequestUrl:(NSString *)urlString success:(void (^)(LCHTTPResult *result))success failure:(void (^)(NSError *error))failure;
{
    LCHTTPParams *params = [LCHTTPParams paramsWithShortUrlStr:urlString];
    return [self params:params success:success failure:failure];
}

@end
