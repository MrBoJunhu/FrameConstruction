//
//  NSString+Category.m
//  FrameConstruction
//
//  Created by BillBo on 2017/8/31.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "NSString+Category.h"

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


@end
