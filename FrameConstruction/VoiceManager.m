//
//  VoiceManager.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/5.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "VoiceManager.h"
#import <AVFoundation/AVFoundation.h>

@interface VoiceManager ()<AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, strong) NSMutableArray *voicesFiles;

@end

@implementation VoiceManager

+(instancetype)manager {
    
    static VoiceManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
    
}


- (NSMutableArray *)voicesFiles{
    
    if (!_voicesFiles) {
        
        self.voicesFiles = [NSMutableArray array];
        
    }
    
    return _voicesFiles;
    
}

- (void)playVoice:(NSArray *)voicesFile{
    
    [self.voicesFiles removeAllObjects];
    
    [self.voicesFiles addObjectsFromArray:voicesFile];
    
    DebugLog(@"%@", self.voicesFiles);
    
    NSString *filePath = self.voicesFiles.firstObject;
    
    [self playVoiceWithFilePath:filePath];
    
}

- (void)playVoiceWithFilePath:(NSString *)filePath {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:filePath ofType:@"mp3"];
    
    DebugLog(@"%@", path);
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfFile:path] error:nil];
    
    self.audioPlayer.delegate = self;
    
    [self.audioPlayer prepareToPlay];
    
    [self play];
    
}


- (void)stopPlayVoice{
    
    if (self.audioPlayer.isPlaying) {
       
        [self.audioPlayer stop];
    
    }

}

- (void)play{
    
    if (self.audioPlayer) {
        
        [self.audioPlayer play];
        
    }
    
}

#pragma mark - 

/* audioPlayerDidFinishPlaying:successfully: is called when a sound has finished playing. This method is NOT called if the player is stopped due to an interruption. */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
    if (flag) {
        
        [self playNext];
    
    }
    
}

/* if an error occurs while decoding it will be reported to the delegate. */

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
    
}

- (void)playNext {
    
    [self.voicesFiles removeObjectAtIndex:0];
    
    if (self.voicesFiles.count > 0) {
        
        [self playVoice:[NSArray arrayWithArray:self.voicesFiles]];
        
    }

}


@end
