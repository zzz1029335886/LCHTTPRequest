//
//  LCUserInfoResult.m
//  kryb
//
//  Created by 凌创科技 on 2017/6/6.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import "LCUserInfoResult.h"

@implementation LCUserInfoResult

- (void)setKeyString:(NSString *)keyString{
    _keyString = keyString;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:keyString forKey:@"loginKeyString"];
    [userDefaults synchronize];
    
}

+ (NSString *)getLoginKeyString;
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"loginKeyString"];
}

@end

@implementation LCUserInfo

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}

@end
