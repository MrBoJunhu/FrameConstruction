//
//  NSDate+Category.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/1.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

+ (NSString *)bb_dateStringWithDate:(NSDate *)date formatterString:(NSString *)formatterString{
    
    return [[NSDateFormatter bb_formatterWithFormatterString:formatterString] stringFromDate:date];
    
}


+ (NSDate *)bb_dateWithDateString:(NSString *)dateString formatterString:(NSString *)formatterString{
    
    return  [[NSDateFormatter bb_formatterWithFormatterString:formatterString] dateFromString:dateString];
    
}

@end
