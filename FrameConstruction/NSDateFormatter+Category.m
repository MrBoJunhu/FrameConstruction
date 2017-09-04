//
//  NSDateFormatter+Category.m
//  FrameConstruction
//
//  Created by BillBo on 2017/9/1.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "NSDateFormatter+Category.h"

@implementation NSDateFormatter (Category)

/**
 获取一个指定格式的 NSDateFormatter

 @param formatterString formatterString description
 @return return value description
 */
+ (NSDateFormatter *)bb_formatterWithFormatterString:(NSString *)formatterString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setLocale:[NSLocale currentLocale]];
    
    [formatter setDateFormat:formatterString];
    
    return formatter;
    
}


@end
