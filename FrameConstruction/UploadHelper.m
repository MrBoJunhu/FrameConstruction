//
//  UploadHelper.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "UploadHelper.h"

#import <AVFoundation/AVFoundation.h>

@interface UploadHelper ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation UploadHelper

+ (instancetype)shareUpUploadHelper{
    
    static UploadHelper *helper = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc] init];
    });
    
    return helper;
}


- (AFHTTPSessionManager *)manager{
    
    if (!_manager) {
        
        self.manager = [AFHTTPSessionManager manager];
       
        self.manager.requestSerializer.timeoutInterval = 20;
        
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
        
    }
    
    return _manager;
    
}

- (NSString *)setAppID:(NSString *)appid token:(NSString *)token hostURL:(NSString *)hosturl pathUrl:(NSString *)urlString {
   
    if (appid.length > 0) {
        
        [self.manager.requestSerializer setValue:appid forHTTPHeaderField:@"appid"];
        
    }
    if (token.length > 0 ) {
        
        [self.manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    }
    
    if (hosturl.length > 0) {
        
        return [NSString stringWithFormat:@"%@/%@",hosturl,urlString];
   
    }else{
        
        return urlString;
  
    }

}


#pragma mark - 上传单张图片

- (void)uploadImage:(UIImage *)image appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString parameters:(id)parameters progress:(ProgressBlock)progress complection:(UploadSuccess)complete faile:(UploadFaile)faile{
    
    @weakify(self);
    
    NSString *uploadString = [self setAppID:appid token:token hostURL:hosturl pathUrl:urlString];
    
    [self.manager POST:uploadString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        /*
         *方法的参数
         1. appendPartWithFileData：要上传的照片[二进制流]
         2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
         3. fileName：要保存在服务器上的文件名
         4. mimeType：上传的文件的类型
         */
     
        [[LocalFileHelper shareLocalFileHelper] compressImageWithImage:image complete:^(NSData *imageData, NSString *fileName) {
           
            // formData: 专门用于拼接需要上传的数据,在此位置生成一个要上传的数据体
            [formData appendPartWithFileData:imageData name:@"upload" fileName:fileName mimeType:@"image/jpeg"];
            
        }];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        [weakself uploadOrDownProgress:uploadProgress progressBlock:progress];
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //上传完成
        [weakself completeUploadSuccessResponseObject:responseObject success:complete];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        complete(@"",error);
        
    }];
    
}

#pragma mark - 上传多张图片

- (void)uploadImages:(NSMutableArray <UIImage *> *)images  appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString parameters:(id)parameters progress:(ProgressBlock)progress complection:(UploadSuccess)complete  faile:(UploadFaile)faile{
  
    @weakify(self);
    
    NSString *uploadString = [self setAppID:appid token:token hostURL:hosturl pathUrl:urlString];
    
    [self.manager POST:uploadString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (NSUInteger i =0 ; i < images.count; i++) {
            
            UIImage *image = images[i];
            
            [[LocalFileHelper shareLocalFileHelper] compressImageWithImage:image complete:^(NSData *imageData, NSString *fileName) {
             
                [formData appendPartWithFileData:imageData name:@"upload" fileName:fileName mimeType:@"png/jpeg"];
                
            }];
            
            
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        [weakself uploadOrDownProgress:uploadProgress progressBlock:progress];

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakself completeUploadSuccessResponseObject:responseObject success:complete];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakself completeUploadError:task error:error faile:faile];
        
    }];
    
}


#pragma mark - 上传视频

- (void)uploadVideoWithPath:(NSString *)videoPath appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString parameters:(id)parameters progress:(ProgressBlock)progress complection:(UploadSuccess)complete  faile:(UploadFaile)faile {
    
    @weakify(self);
    
    NSString *uploadString = [self setAppID:appid token:token hostURL:hosturl pathUrl:urlString];

    [[LocalFileHelper shareLocalFileHelper] exportVideoWithPath:videoPath exportComplete:^(NSString *exportCompressPath) {
       
        //压缩成功,上传
        [weakself.manager POST:uploadString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            NSString *fileName = [NSString stringWithFormat:@"%@.mp4",[NSDate dateStringWithDate:[NSDate date] formatterString:tempFileNameDateFormatter]];
            
            [formData appendPartWithFileURL:[NSURL fileURLWithPath:exportCompressPath] name:@"videoUpload" fileName:fileName mimeType:@"video/mpeg4" error:nil];
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
            [weakself uploadOrDownProgress:uploadProgress progressBlock:progress];
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [weakself completeUploadSuccessResponseObject:responseObject success:complete];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [weakself completeUploadError:task error:error faile:faile];
            
        }];

        
    }];
    
}

#pragma mark - 单文件的下载

- (void)downloadFileWithSavePath:(NSString *)savePath appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString parameters:(id)parameters progress:(ProgressBlock)progress complection:(UploadSuccess)complete  faile:(UploadFaile)faile{
    
    @weakify(self);
    
    NSString *downloadUrlString = [self setAppID:appid token:token hostURL:hosturl pathUrl:urlString];

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:downloadUrlString]];
    
     [self.manager downloadTaskWithRequest:urlRequest progress:^(NSProgress * _Nonnull downloadProgress) {
        
        [weakself uploadOrDownProgress:downloadProgress progressBlock:progress];
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        return [NSURL URLWithString:savePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (!error) {
            
            complete(@"下载完成!",nil);
        }
        
    }];
    
}


#pragma mark - ☺️

#pragma mark - 上传/下载 进度
- (void)uploadOrDownProgress:(NSProgress *)progress progressBlock:(ProgressBlock)block{
    
    DebugLog(@" 上传或下载进度 : %.2lld", progress.completedUnitCount/progress.totalUnitCount);

    block(progress.completedUnitCount/progress.totalUnitCount);
    
}



#pragma mark - 上传成功

- (void)completeUploadSuccessResponseObject:(id)responseObject success:(UploadSuccess)success {
    
    DebugLog(@"上传成功! \n responseObject  : %@", responseObject);
    success(responseObject,nil);

}

#pragma mark - 上传失败

- (void)completeUploadError:(NSURLSessionDataTask *)task error:(NSError *)error faile:(UploadFaile)faile{
    
    NSDictionary *errorJson = [self dealErrorTask:task error:error];
    
    NSString *errorCode = [NSString tranceDataToString:errorJson[@"status"]];
    
    DebugLog(@"自定义错误码 : %@", errorCode);
    DebugLog(@"上传失败 \n %@", errorJson);
    //处理错误信息
    //譬如 : 服务器自定义,错误码 401 为账号被踢
    if([errorCode isEqualToString:@"401"]){
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您的帐号已经在其他设备登录，请重新登录后再试。" preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"现在登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
            //账号被踢
            
            
        }];
        
        [alertController addAction:okAction];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
        
    }
    
    faile(errorJson, errorCode);

}

- (NSDictionary *)dealErrorTask:(NSURLSessionDataTask *)task error:(NSError *)error{
    
    NSHTTPURLResponse *response = (NSHTTPURLResponse*)task.response;
    
    //通讯协议状态码
    NSInteger statusCode = response.statusCode;
    
    DebugLog(@"通讯协议状态码 : %ld ", statusCode)
    
    //服务器返回的业务逻辑报文信息
    NSString* errResponse = [self getErrorString:error];
    
    NSError *tempError;
    
    NSData *errorData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *errorJson = [NSJSONSerialization JSONObjectWithData:errorData options:NSJSONReadingMutableContainers error:&tempError];
    
    return errorJson;
    
}

- (NSString *)getErrorString:(NSError *)error {
    
    return [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
    
}


@end
