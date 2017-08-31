//
//  UploadHelper.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "UploadHelper.h"

@implementation UploadHelper

+ (instancetype)shareUpUploadHelper{
    
    static UploadHelper *helper = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc] init];
    });
    
    return helper;
}


#pragma mark - 上传图片

- (void)uploadImage:(UIImage *)image andImageData:(NSData *)imageData appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString complection:(UploadSuccess)complete{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    if (appid.length > 0) {
        
        [manager.requestSerializer setValue:appid forHTTPHeaderField:@"appid"];
        
    }
    if (token.length > 0 ) {
        
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    }
    
    [manager POST:[NSString stringWithFormat:@"%@/%@",hosturl,urlString] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:imageData name:@"img.png" fileName:@"img.png" mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //上传完成
        complete(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        complete(@"",error);
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
        
        //通讯协议状态码
        NSInteger statusCode = response.statusCode;
        
        //服务器返回的业务逻辑报文信息
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
      
        NSError *tempError;
        
        NSData *errorData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *errorJson = [NSJSONSerialization JSONObjectWithData:errorData options:NSJSONReadingMutableContainers error:&tempError];
        
        DebugLog(@"%@", errorJson);
        
        NSString *errorCode = [NSString tranceDataToString:errorJson[@"status"]];
        
        //譬如服务器自定义,错误码 401 为账号被踢
        
        if([errorCode isEqualToString:@"401"]){
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您的帐号已经在其他设备登录，请重新登录后再试。" preferredStyle: UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"现在登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                
                //账号被踢

                
            }];
            
            [alertController addAction:okAction];
            
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
            
        }
        
    }];
    
}


@end
