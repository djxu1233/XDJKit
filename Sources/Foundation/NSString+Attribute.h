//
//  NSString+Attribute.h
//  TransformDemo
//
//  Created by DJ on 2018/12/12.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Attribute)

/**
 * 设置字符串字体大小和颜色
 *
 * @param text 字符串
 * @param font 字体大小
 * @param color 字体颜色
 *
 * @return 富文本
 */

+ (NSMutableAttributedString *)getAttributedTextWithText:(NSString *)text
                                                    font:(UIFont *)font
                                                   color:(UIColor *)color;

/**
 * 设置字符串字体大小、颜色、行间距和字间距
 *
 * @param text 字符串
 * @param font 字体大小
 * @param color 字体颜色
 * @param space 行间距
 * @param kern 字间距
 *
 * @return 富文本
 */
+ (NSMutableAttributedString *)getAttributedTextWithText:(NSString *)text
                                                    font:(UIFont *)font
                                                   color:(UIColor *)color
                                               lineSpace:(CGFloat)space
                                                    kern:(CGFloat)kern;

/**
 * 设置NSMutableAttributedString分段颜色字体
 *
 * @param text 需要设置的字符串
 * @param range 范围
 * @param font 字体
 * @param color 颜色
 *
 * @return NSMutableAttributedString
 */
/** */
+ (NSMutableAttributedString *)getRangeForegroundAttributedTextWithText:(NSString *)text
                                                                  range:(NSRange)range
                                                                   font:(UIFont *)font
                                                                  color:(UIColor *)color;

/**
 * 设置NSMutableAttributedString分段颜色字体及下划线
 *
 * @param text 需要设置的字符串
 * @param range 范围
 * @param font 字体
 * @param color 颜色
 *
 * @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)getRangeForegroundUnderlineAttributedTextWithText:(NSString *)text
                                                                           range:(NSRange)range
                                                                            font:(UIFont *)font
                                                                           color:(UIColor *)color;


@end
