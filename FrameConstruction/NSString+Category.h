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



#pragma mark - Encode & Decode
/**
 *  Base64 编码
 *
 *  @return 编码后的字符
 */
- (NSString *)bb_base64Encode;
/**
 *  Base64 解码
 *
 *  @return 解码后的字符
 */
- (NSString *)bb_base64Decode;

/**
 *  MD5 编码
 *
 *  @return 编码后的字符
 */
- (NSString *)bb_md5Encode;

/**
 *  转译中文
 *
 *  @param chinese 中文字符
 *
 */

+(NSString *)lowercaseSpellingWithChineseCharacters:(NSString *)chinese;
@end

