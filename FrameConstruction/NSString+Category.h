//
//  NSString+Category.h
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Category)

/**
 计算字符串的frame

 @param givenString givenString description
 @param fontSize fontSize description
 @return return value description
 */
+(CGRect )rectForString:(NSString *)givenString fontSize:(CGFloat)fontSize;


/**
 计算字符串的size

 @param givenString givenString description
 @param fontSize fontSize description
 @return return value description
 */
+(CGSize )sizeForString:(NSString *)givenString fontSize:(CGFloat)fontSize;


/**
 计算字符串 高度

 @param givenString givenString description
 @param fontSize fontSize description
 @return return value description
 */
+(CGFloat )heightForString:(NSString *)givenString fontSize:(CGFloat)fontSize;


/**
 计算字符串的 宽度

 @param givenString givenString description
 @param fontSize fontSize description
 @return return value description
 */
+(CGFloat )widthForString:(NSString *)givenString fontSize:(CGFloat)fontSize;


/**
 对象转String

 @param object object description
 @return return value description
 */
+ (NSString *)tranceDataToString:(id)object;


@end

