//
//  NetworkManager.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/4.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkRequest.h"
@interface NetworkManager : NSObject

+(instancetype)shareNetworkManager;

- (void)sendRequest:(NetworkRequest *)request success:(requestSuccess)success faile:(requestFaile)faile;

@end
