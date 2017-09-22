//
//  MacroFileHeader.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#ifndef MacroFileHeader_h
#define MacroFileHeader_h

#define UIColorRGB(r,g,b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]

#define UIColorRGBAlpha(r,g,b,alpha) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:alpha]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define NSBundleXib(name) [[NSBundle mainBundle] loadNibNamed:name owner:self options:nil].firstObject


//国际化
#define BBLocalizedString(string) NSLocalizedString(string, nil)


#define ENABLE_DEBUG


#ifdef ENABLE_DEBUG
#define DebugLog(format, args...) \
NSLog(@"%s, line %d: " format "\n", \
__func__, __LINE__, ## args);
#else
#define DebugLog(format, args...) do {} while(0)
#endif


#endif /* MacroFileHeader_h */
