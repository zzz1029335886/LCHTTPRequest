//
//  LCHTTPParams.h
//  kryb
//
//  Created by 凌创科技 on 2017/6/2.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHTTPParams : NSObject

+ (instancetype)paramsWithShortUrlStr:(NSString *)shortUrlString;

@property (nonatomic,assign)BOOL intercept;
@property (nonatomic,assign)BOOL alert;

@property (nonatomic,strong)NSString *shortUrlString;
@property (nonatomic,strong)NSString *pc;

@property (nonatomic,strong)NSMutableDictionary *dict;

@property (nonatomic,assign)NSInteger page;
@property (nonatomic,assign)NSInteger size;


@end
