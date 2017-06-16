//
//  LCUserInfoResult.h
//  kryb
//
//  Created by 凌创科技 on 2017/6/6.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import "LCHTTPResult.h"
@class LCUserInfo;

@interface LCUserInfoResult : LCHTTPResult
@property (nonatomic,strong)LCUserInfo *userInfo;
@property (nonatomic,strong)NSString *keyString;
+ (NSString *)getLoginKeyString;

@end

@interface LCUserInfo : NSObject
@property (nonatomic,strong)NSNumber *ID;
@property (nonatomic,strong)NSNumber *projectId;
@property (nonatomic,strong)NSNumber *headImg;
@property (nonatomic,strong)NSNumber *accountId;

/*
"id": 2,
"projectId": 1,
"headImg": 0,
"accountId": 4,
"name": "",
"phone": "",
"age": "",
"signature": "",
"job": "",
"province": "",
"city": "",
"address": "",
"terminalId": "",
"birthday": "",
"createTime": "2017-02-15 19:05:00:260",
"updateTime": "2017-02-15 19:05:00:260"
 */
@end
