//
//  WHNetWorkStatus.m
//  WHEmptyPageViewDemo
//
//  Created by 王红 on 2018/1/30.
//  Copyright © 2018年 王红. All rights reserved.
//

#import "WHNetWorkStatus.h"
@interface WHNetWorkStatus()
@property (nonatomic) DSReachability *hostReachability;
//@property (nonatomic) Reachability *internetReachability;
//@property (nonatomic) Reachability *wifiReachability;
@end

@implementation WHNetWorkStatus

- (instancetype)init{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kDSReachabilityChangedNotification object:nil];
        NSString *remoteHostName = @"www.baidu.com";
        self.hostReachability = [DSReachability reachabilityWithHostName:remoteHostName];
        [self.hostReachability startNotifier];
        
        //        self.internetReachability = [Reachability reachabilityForInternetConnection];
        //        [self.internetReachability startNotifier];
        //
        //        self.wifiReachability = [Reachability reachabilityForLocalWiFi];
        //        [self.wifiReachability startNotifier];
    }
    return self;
}

+ (instancetype)sharedNetWorkStatus{
    static WHNetWorkStatus *dsNetWorkStatus = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dsNetWorkStatus = [[WHNetWorkStatus alloc] init];
        dsNetWorkStatus.netWorkStatus = ReachableUnknown;
    });
    return dsNetWorkStatus;
}

- (void) reachabilityChanged:(NSNotification *)note{
    DSReachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[DSReachability class]]);
    self.netWorkStatus = [curReach currentReachabilityStatus];
    //    [self updateInterfaceWithReachability:curReach];
}

- (void)updateInterfaceWithReachability:(DSReachability *)reachability{
    //    if (reachability == self.hostReachability){
    //        NetworkStatus netStatus = [reachability currentReachabilityStatus];
    //        BOOL connectionRequired = [reachability connectionRequired];
    //
    //        NSString* baseLabelText = @"";
    //
    //        if (connectionRequired){
    //            baseLabelText = NSLocalizedString(@"Cellular data network is available.\nInternet traffic will be routed through it after a connection is established.", @"Reachability text if a connection is required");
    //        }else{
    //            baseLabelText = NSLocalizedString(@"Cellular data network is active.\nInternet traffic will be routed through it.", @"Reachability text if a connection is not required");
    //        }
    //    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kDSReachabilityChangedNotification object:nil];
}
@end
