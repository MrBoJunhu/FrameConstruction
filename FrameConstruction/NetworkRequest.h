//
//  NetworkRequest.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/4.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkError : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSUInteger status;

@end

typedef NS_ENUM(NSUInteger, RequestType) {
    
    GET_RequestType = 0,
    
    POST_RequestType,
    
};

typedef void(^requestSuccess)(id responseObject);

typedef void(^requestFaile)(NetworkError *error);

@interface NetworkRequest : NSObject

- (void)startRestest:(requestSuccess)success faile:(requestFaile)faile;

#pragma mark - 接口声明

+ (instancetype)requesForDynamicLoginaccid:(NSString *)Loginaccid pageIndex:(NSString *)pageIndex pageSize:(NSString *)pageSize;

@end
