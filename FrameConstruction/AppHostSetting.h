//
//  AppHostSetting.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/4.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#ifndef AppHostSetting_h
#define AppHostSetting_h

static NSString *LaiAppID = @"9109F01FC1369AFE";


#define UAT

#ifdef UAT

#define Host_url  @"http://115.29.187.163:8082/"

#else

#endif


#endif /* AppHostSetting_h */
