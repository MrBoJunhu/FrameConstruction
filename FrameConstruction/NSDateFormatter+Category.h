//
//  NSDateFormatter+Category.h
//  FrameConstruction
//
//  Created by BillBo on 2017/9/1.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Category)

/**
 获取
 
 @param formatterString formatterString description
 @return return value description
 */
+ (NSDateFormatter *)formatterWithFormatterString:(NSString *)formatterString;

@end
