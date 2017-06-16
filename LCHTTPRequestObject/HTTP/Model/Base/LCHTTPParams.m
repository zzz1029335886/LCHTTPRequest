//
//  LCHTTPParams.m
//  kryb
//
//  Created by 凌创科技 on 2017/6/2.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import "LCHTTPParams.h"

@implementation LCHTTPParams

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pc = LCProjectCode;
        self.intercept = YES;
    }
    return self;
}

- (NSMutableDictionary *)dict{
    if(!_dict){
        _dict = [NSMutableDictionary dictionary];
    }
    return _dict;
}

+ (instancetype)params
{
    return [[self alloc]init];
}

+ (instancetype)paramsWithShortUrlStr:(NSString *)shortUrlString;
{
    LCHTTPParams *params = [LCHTTPParams params];
    params.shortUrlString = shortUrlString;
    return params;
}

@end
