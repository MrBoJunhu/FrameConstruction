//
//  NetworkRequest.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/4.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkError

+ (instancetype)errorWithNSError:(NSError *)error
{
    NetworkError *networkError = [[NetworkError alloc] init];
    
    networkError.msg = NSLocalizedString(@"NetworkError_Unknown", nil);
    switch (error.code) {
        case NSURLErrorNotConnectedToInternet:
        case NSURLErrorCannotConnectToHost:
        case kCFURLErrorNetworkConnectionLost:
        {
            //Could not connect to the server
            networkError.msg = @"无法连接到服务器";
        }
            break;
        case NSURLErrorTimedOut:
        {
            //time out
            networkError.msg = @"请求超时";
        }
            break;
        case NSURLErrorBadServerResponse:
            networkError.msg = @"服务器错误";
            break;
        default:
            break;
    }
    
    networkError.status = error.code;
    
    return networkError;
}


@end



@interface NetworkRequest(){
    
    NSString *urlString;
    
    NSDictionary *parameterDic;
    
    RequestType _requestType;
    
}

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation NetworkRequest

+(instancetype)requestWithGET_Url:(const NSString *)url{
    
    return [[self alloc] initWithUrl:url parameter:nil type:GET_RequestType];
    
}

+ (instancetype)requestWithGET_Url:(const NSString *)url parameter:(NSDictionary *)parDic {
    
    return [[self alloc] initWithUrl:url parameter:parDic type:GET_RequestType];

}

+ (instancetype)requestWithPOST_Url:(const NSString *)url parameter:(NSDictionary *)parDic {
    
    return [[self alloc] initWithUrl:url parameter:parDic type:POST_RequestType];
}

+ (instancetype)requestWirhPOST_Url:(const NSString *)url {
    
    return [[self alloc] initWithUrl:url parameter:nil type:POST_RequestType];
    
}

#pragma mark - 私有初始化方法

- (instancetype)initWithUrl:(const NSString *)url parameter:(id)parameter type:(RequestType)requestType {
    
    if ([super init]) {
        
        urlString = [NSString stringWithFormat:@"%@%@",Host_url,url];
        
        parameterDic = [NSDictionary dictionaryWithDictionary:parameterDic];
        
        _requestType = requestType;
        
        self.sessionManager = [AFHTTPSessionManager manager];
        
        self.sessionManager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
        //在 AFHTTPResponseSerializer 的初始化方法中更改成功的 code范围
        self.sessionManager.requestSerializer.timeoutInterval = 15;
        
        self.sessionManager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
        
        [self.sessionManager.requestSerializer setValue:LaiAppID forHTTPHeaderField:@"appid"];
       
        [self.sessionManager.requestSerializer setValue:@"游客" forHTTPHeaderField:@"token"];
  
    }

    return self;
    
}

- (void)startRestest:(requestSuccess)success faile:(requestFaile)faile{
    
    @weakify(self);
    
    switch (_requestType) {
        case GET_RequestType:{
            
            [self.sessionManager GET:urlString parameters:parameterDic progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                [weakself requesSuccess:success task:task response:responseObject];
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                [weakself requestFaile:faile task:task error:error];

            }];
            
        }
            break;
       
        case POST_RequestType:
        {
        
            [self.sessionManager POST:urlString parameters:parameterDic progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                [weakself requesSuccess:success task:task response:responseObject];
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                [weakself requestFaile:faile task:task error:error];
                
            }];
            
        }
            break;
            
        default:
            break;
            
    }
    
}

- (void)requesSuccess:(requestSuccess)success task:(NSURLSessionDataTask *)task response:(id)responseData {
    
    //返回的数据转json
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
    DebugLog(@"\n----------- 🍎 ------------\n ----------- 加载成功了 ------------\n ----------- 🍎 ------------\n%@", responseDict);
    
    //如果是服务器在
    
    
    success(responseDict);

}

- (void)requestFaile:(requestFaile)faile task:(NSURLSessionDataTask *)task error:(NSError *)error {
    
    faile([NetworkError errorWithNSError:error]);
    
}


#pragma mark - 接口实现

+ (instancetype)requesForDynamicLoginaccid:(NSString *)Loginaccid pageIndex:(NSString *)pageIndex pageSize:(NSString *)pageSize{
    
    NetworkRequest *request = [NetworkRequest requestWithGET_Url:[NSString stringWithFormat:@"%@?Loginaccid=%@&pageIndex=%@&PageSize=%@",dynamicUrl,Loginaccid,pageIndex,pageSize]];
    
    return request;
}

@end
