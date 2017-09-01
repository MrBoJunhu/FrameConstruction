//
//  LocalFileHelper.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/1.
//  Copyright © 2017年 BillBo. All rights reserved.
//  文件处理类

#import "LocalFileHelper.h"

#import <AVFoundation/AVFoundation.h>

@implementation LocalFileHelper

+ (instancetype)shareLocalFileHelper {
    
    static LocalFileHelper *helper = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc] init];
    });
    return helper;
}


#pragma mark - 视频压缩保存到沙盒

- (void)exportVideoWithPath:(NSString *)videoPath exportComplete:(ExportVideoBlock)complete{
    
    //获取视频资源
    AVURLAsset *avAsset = [AVURLAsset assetWithURL:[NSURL URLWithString:videoPath]];
    
    //压缩视频
    AVAssetExportSession *avExport = [AVAssetExportSession exportSessionWithAsset:avAsset presetName:AVAssetExportPreset640x480];
    
    //获取沙盒
    NSString *cachesString = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    //视频名
    NSString *videoName = [NSString stringWithFormat:@"%@.mp4",[NSDate dateStringWithDate:[NSDate date] formatterString:tempFileNameDateFormatter]];
    
    //压缩后存储路径
    NSString *savePath = [cachesString stringByAppendingString:[NSString stringWithFormat:@"/out_%@",videoName]];
    
    //压缩后输出url
    avExport.outputURL = [NSURL URLWithString:savePath];
    
    //格式MP4
    avExport.outputFileType = AVFileTypeMPEG4;
    
    switch (avExport.status) {
        case AVAssetExportSessionStatusExporting:
        {
            DebugLog(@"正在压缩视频");
        }
            break;
            
        default:
            break;
    }
    
    if (avExport.status == AVAssetExportSessionStatusCompleted) {
      
        //压缩完成
        complete(savePath);
        
    }
    
}

- (void)compressImageWithImage:(UIImage *)image complete:(CompressImageBlock)complete {
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    
    NSString *fileName = [NSString stringWithFormat:@"%@_img.png",[NSDate dateStringWithDate:[NSDate date] formatterString:tempFileNameDateFormatter]];
    
    complete(imageData,fileName);

}


@end
