//
//  LCEnumeResult.h
//  kryb
//
//  Created by 凌创科技 on 2017/6/12.
//  Copyright © 2017年 凌创科技. All rights reserved.
//

#import "LCHTTPResult.h"
@class LCEnumeInfo;

@interface LCEnumeResult : LCHTTPResult
@property (nonatomic,strong)NSArray<LCEnumeInfo *> *list;

@end

@interface LCEnumeInfo : LCHTTPResultIDModel
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *imgs;
@property (nonatomic,assign)BOOL select;

@end
