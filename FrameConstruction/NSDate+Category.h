//
//  NSDate+Category.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/1.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)


/**
 NSDate 转给定格式的 日期字符串

 @param date date description
 @param formatterString formatterString description
 @return return value description
 */
+(NSString *)bb_dateStringWithDate:(NSDate *)date formatterString:(NSString *)formatterString;


/**
 日期字符串 转给定格式的 NSDate

 @param dateString dateString description
 @param formatterString formatterString description
 @return return value description
 */
+(NSDate *)bb_dateWithDateString:(NSString *)dateString formatterString:(NSString *)formatterString;


@end
