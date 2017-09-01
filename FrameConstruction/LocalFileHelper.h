//
//  LocalFileHelper.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/1.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

//视频压缩
typedef void(^ExportVideoBlock)(NSString *exportCompressPath);

//图片压缩
typedef void(^CompressImageBlock)(NSData *imageData, NSString *fileName);

@interface LocalFileHelper : NSObject

+ (instancetype)shareLocalFileHelper;

/**
 视频压缩
 @param videoPath 原视频路径
 @param complete 完成回调
 */
- (void)exportVideoWithPath:(NSString *)videoPath exportComplete:(ExportVideoBlock)complete;

/**
 图片压缩 转Data

 @param image 图片
 @param complete 回调
 */
- (void)compressImageWithImage:(UIImage *)image complete:(CompressImageBlock)complete;
@end
