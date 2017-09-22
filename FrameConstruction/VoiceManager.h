//
//  VoiceManager.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/5.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoiceManager : NSObject

+ (instancetype)manager;

- (void)playVoice:(NSArray *)voicesFile;

- (void)stopPlayVoice;

- (void)play;


@end
