//
//  UploadHelper.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^UploadSuccess)(id  responseData, NSError *error);


@interface UploadHelper : NSObject

+ (instancetype)shareUpUploadHelper;


/**
 上传图片

 @param image image description
 @param imageData imageData description
 @param appid appid description
 @param token token description
 @param hosturl hosturl description
 @param urlString urlString description
 @param complete complete description
 */
- (void)uploadImage:(UIImage *)image andImageData:(NSData *)imageData appid:(NSString *)appid token:(NSString *)token hostUrl:(NSString *)hosturl pathUrlString:(NSString *)urlString complection:(UploadSuccess)complete;


@end
