//
//  NSString+Attribute.m
//  TransformDemo
//
//  Created by DJ on 2018/12/12.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "NSString+Attribute.h"
#import <CoreText/CoreText.h>

@implementation NSString (Attribute)

+ (NSMutableAttributedString *)getAttributedTextWithText:(NSString *)text
                                                    font:(UIFont *)font
                                                   color:(UIColor *)color
{
    if (!text.length || text == nil) {
        return nil;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSDictionary *attriDict = @{NSForegroundColorAttributeName:color, NSFontAttributeName:font};
    [attributedString setAttributes:attriDict range:NSMakeRange(0, text.length)];
    return attributedString;
}

+ (NSMutableAttributedString *)getAttributedTextWithText:(NSString *)text
                                                    font:(UIFont *)font
                                                   color:(UIColor *)color
                                               lineSpace:(CGFloat)space
                                                    kern:(CGFloat)kern
{
    if (!text.length || text == nil) {
        return nil;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;

    NSDictionary *attriDict = @{NSParagraphStyleAttributeName:paragraphStyle, NSForegroundColorAttributeName:color, NSFontAttributeName:font, NSKernAttributeName:@(kern)};
    [attributedString setAttributes:attriDict range:NSMakeRange(0, text.length)];
    return attributedString;
}

/** 设置NSMutableAttributedString分段颜色字体*/
+ (NSMutableAttributedString *)getRangeForegroundAttributedTextWithText:(NSString *)text
                                                                  range:(NSRange)range
                                                                   font:(UIFont *)font
                                                                  color:(UIColor *)color
{
    if (!text.length || text == nil) {
        return nil;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSDictionary *attriDict = @{NSForegroundColorAttributeName:color, NSFontAttributeName:font};
    [attributedString setAttributes:attriDict range:range];
    
    return attributedString;
}

+ (NSMutableAttributedString *)getRangeForegroundUnderlineAttributedTextWithText:(NSString *)text
                                                                           range:(NSRange)range
                                                                            font:(UIFont *)font
                                                                           color:(UIColor *)color
{
    if (!text.length || text == nil) {
        return nil;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    ///设置分段颜色
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    ///设置分段字体
    [attributedString addAttribute:NSFontAttributeName value:font range:range];
    ///设置分段下划线类型（单行下划线）
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    ///设置分段下划线的颜色
    [attributedString addAttribute:NSUnderlineColorAttributeName value:color range:range];
    
    return attributedString;
}

@end
