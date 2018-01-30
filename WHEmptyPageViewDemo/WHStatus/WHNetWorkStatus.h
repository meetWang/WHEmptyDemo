//
//  WHNetWorkStatus.h
//  WHEmptyPageViewDemo
//
//  Created by 王红 on 2018/1/30.
//  Copyright © 2018年 王红. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSReachability.h"

@interface WHNetWorkStatus : NSObject
@property (nonatomic) NetworkStatus netWorkStatus;

+ (instancetype)sharedNetWorkStatus;
@end
