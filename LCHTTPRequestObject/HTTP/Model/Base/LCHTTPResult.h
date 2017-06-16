//
//  LCHTTPResult.h
//  kryb
//
//  Created by 凌创科技 on 2017/6/2.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCHTTPResultIDModel.h"

@interface LCHTTPResult : NSObject
@property (nonatomic,assign)NSInteger code;
@property (nonatomic,strong)NSString *msg;
@property (nonatomic,strong)NSDictionary *resp;


@end
