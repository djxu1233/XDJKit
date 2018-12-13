//
//  UILabel+AttributedText.h
//  TransformDemo
//
//  Created by DJ on 2018/12/12.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AttributedText)

/**
 * 设置label行间距
 *
 * @param text label文本
 * @param space 行间距
 */
- (void)setLineSpaceWithText:(NSString *)text lineSpace:(CGFloat)space;

/**
 * 设置label字间距
 *
 * @param text label文本
 * @param space 字间距
 */
- (void)setWordSpaceWithText:(NSString *)text wordSpace:(CGFloat)space;

/**
 * 设置label行间距、字间距
 *
 * @param text label文本
 * @param lineSpace 行间距
 * @param wordSpace 字间距
 */
- (void)setSpaceWithText:(NSString *)text lineSpace:(CGFloat)lineSpace wordSpace:(CGFloat)wordSpace;

/**
 * 设置label字符串里的某段字符串（子字符串）的颜色和字体
 *
 * @param text label文本的子文本
 * @param color 颜色
 * @param font 字体
 */
- (void)setSpecificTextWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font;

/**
 * 设置label字符串指定范围的颜色和字体
 *
 * @param range 指定的范围
 * @param color 颜色
 * @param font 字体
 */
- (void)setSpecificTextWithRange:(NSRange)range color:(UIColor *)color font:(UIFont *)font;

/**
 * 计算label的高度，支持单行和多行，行间距
 *
 * @param text label文本
 * @param font 字体
 * @param space 行间距
 * @param kern 字间距
 * @param width label宽度
 *
 * @return 返回label的高度
 */
+ (CGFloat)calculateLabelSizeWithText:(NSString *)text font:(UIFont *)font lineSpace:(CGFloat)space kern:(CGFloat)kern maxWidth:(CGFloat)width;

/**
 * 计算label的高度，不带行间距
 *
 * @param text label文本
 * @param font 字体
 * @param width label宽度
 *
 * @return 返回label的高度
 */
+ (CGFloat)calculateLabelSizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)width;


@end
