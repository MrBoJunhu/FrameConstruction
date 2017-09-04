//
//  NetworkManager.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/4.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "NetworkManager.h"

@interface NetworkManager(){
    
    NetworkRequest *_request;
    
    requestSuccess successBlock;
    
    requestFaile faileBlock;
}



@end

@implementation NetworkManager

+ (instancetype)shareNetworkManager{
    
    static NetworkManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
    
}

- (void)sendRequest:(NetworkRequest *)request success:(requestSuccess)success faile:(requestFaile)faile {
    
    _request = request;
    
    successBlock = success;
    
    faileBlock = faile;
    
    [_request startRestest:success faile:faile];
    
}

@end
