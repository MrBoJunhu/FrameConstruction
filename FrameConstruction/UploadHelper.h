//
//  UploadHelper.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^UploadSuccess)(id  responseData, NSError *error);

typedef void(^UploadFaile)(id errorJson, NSString *errorCode);


typedef void(^DownloadSuccess)(NSString *filePath);

typedef void(^DownloadFaile)(NSError *error);

typedef void(^ProgressBlock)(float progress);

@interface UploadHelper : NSObject

+ (instancetype)shareUpUploadHelper;


/**
 上传单张图片

 @param image 图片
 @param appid AppID
 @param token Token
 @param hosturl Host
 @param urlString Url
 @param parameters 参数
 @param progress 进度
 @param complete 成功
 @param faile 失败
 */
- (void)uploadImage:(UIImage *)image appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString parameters:(id)parameters progress:(ProgressBlock)progress complection:(UploadSuccess)complete faile:(UploadFaile)faile ;


/**
 上传多张图片
 @param images 图片集合
 @param appid AppID
 @param token Token
 @param hosturl Host
 @param urlString Url
 @param parameters 参数
 @param progress 进度
 @param complete 成功
 @param faile 失败
 */
- (void)uploadImages:(NSMutableArray <UIImage *> *)images  appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString parameters:(id)parameters progress:(ProgressBlock)progress complection:(UploadSuccess)complete  faile:(UploadFaile)faile;

/**
 视频上传
 @param videoPath 原视频路径
 @param appid AppID
 @param token Token
 @param hosturl Host
 @param urlString Url
 @param parameters 参数
 @param progress 进度
 @param complete 成功
 @param faile 失败
 */
- (void)uploadVideoWithPath:(NSString *)videoPath appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString parameters:(id)parameters progress:(ProgressBlock)progress complection:(UploadSuccess)complete  faile:(UploadFaile)faile;

/**
 单个文件的下载

 @param savePath 文件保存路径
 @param appid AppID
 @param token Token
 @param hosturl Host
 @param urlString Url
 @param parameters 参数
 @param progress 进度
 @param complete 成功
 @param faile 失败
 */
- (void)downloadFileWithSavePath:(NSString *)savePath appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString parameters:(id)parameters progress:(ProgressBlock)progress complection:(DownloadSuccess)complete  faile:(DownloadFaile)faile;

/**
 暂停下载
 */
- (void)stopDownload;

/**
 继续下载
 */
- (void)continueDownload;


@end
