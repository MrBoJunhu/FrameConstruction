//
//  NSString+Category.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "NSString+Category.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Category)

+(CGRect)rectForString:(NSString *)givenString fontSize:(CGFloat)fontSize {
    
    return [givenString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
}

+ (CGSize)sizeForString:(NSString *)givenString fontSize:(CGFloat)fontSize {
    
    return [self rectForString:givenString fontSize:fontSize].size;
}

+(CGFloat)heightForString:(NSString *)givenString fontSize:(CGFloat)fontSize{
    
    return [self sizeForString:givenString fontSize:fontSize].height;
    
}

+ (CGFloat)widthForString:(NSString *)givenString fontSize:(CGFloat)fontSize {
    
    return [self sizeForString:givenString fontSize:fontSize].width;
    
}

+ (NSString *)tranceDataToString:(id)object{
    
    if ([object isKindOfClass:[NSString class]]) {
        
        return object;
        
    }else if ([object isKindOfClass:[NSNumber class]]){
        
        NSNumber *afterTranceObject = object;
        
        return afterTranceObject.stringValue;
        
    }else{
        
        return @"";
    }
    
}

- (NSString *)bb_base64Encode {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)bb_base64Decode {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)bb_md5Encode {
    const char *concat_str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(concat_str, (CC_LONG)strlen(concat_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash uppercaseString];
}

+(NSString *)lowercaseSpellingWithChineseCharacters:(NSString *)chinese {
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:chinese];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    //返回小写拼音
    return [str lowercaseString];
}


@end
