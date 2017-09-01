
//
//  ImageDownloadViewController.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/1.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ImageDownloadViewController.h"

@interface ImageDownloadViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageV;
@property (nonatomic, strong) AFHTTPSessionManager * manager;
@property (strong, nonatomic) IBOutlet UIProgressView *progressV;

@end

@implementation ImageDownloadViewController

- (AFHTTPSessionManager *)manager{
    
    if (!_manager) {
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        self.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
        
        self.manager.requestSerializer.timeoutInterval = 20;
        
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
        
    }
    
    return _manager;
    
}


- (void)viewDidLoad {
   
    [super viewDidLoad];

}

- (IBAction)beginDownload:(id)sender {

    NSString *urlString = @"http://www.baidu.com/img/bdlogo.png";
    
    NSString *savePath = [[LocalFileHelper shareLocalFileHelper] createDirectoryInCachesWithDirectoryName:@"测试文件夹"];
    
    if (savePath != nil) {
        
        @weakify(self);
        
        [[UploadHelper shareUpUploadHelper] downloadFileWithSavePath:savePath appid:nil token:nil hostUrl:nil pathUrlString:urlString parameters:nil progress:^(float progress) {
            
            DebugLog(@"%f.2", progress);
          
            dispatch_async(dispatch_get_main_queue(), ^{
                
                weakself.progressV.progress = progress;
                
            });
            
        } complection:^(NSString *filePath) {
            
            DebugLog(@"%@", filePath);
            
            UIImage *img = [UIImage imageWithContentsOfFile:filePath];
            
            weakself.imageV.image = img;
            
        } faile:^(NSError *error) {
            
            
        }];
        
    }
    
}


@end
