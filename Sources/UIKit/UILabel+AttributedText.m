//
//  UILabel+AttributedText.m
//  TransformDemo
//
//  Created by DJ on 2018/12/12.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "UILabel+AttributedText.h"
#import <CoreText/CoreText.h>

@implementation UILabel (AttributedText)

- (void)setLineSpaceWithText:(NSString *)text lineSpace:(CGFloat)space {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    self.attributedText = attributedString;
    [self sizeToFit];
}

- (void)setWordSpaceWithText:(NSString *)text wordSpace:(CGFloat)space {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    //调整间距
    [attributedString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(space) range:NSMakeRange(0, text.length)];
    self.attributedText = attributedString;
    [self sizeToFit];
}

- (void)setSpaceWithText:(NSString *)text lineSpace:(CGFloat)lineSpace wordSpace:(CGFloat)wordSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(wordSpace) range:NSMakeRange(0, text.length)];
    self.attributedText = attributedString;
    [self sizeToFit];
}

- (void)setSpecificTextWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font {
    if (text) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
        NSRange range = [self.text rangeOfString:text];
        if (color) {
            [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(range.location, range.length)];
        }
        if (font != 0) {
            [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(range.location, range.length)];
        }
        self.attributedText = attributedString;
    }
}

- (void)setSpecificTextWithRange:(NSRange)range color:(UIColor *)color font:(UIFont *)font {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    if (color) {
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(range.location, range.length)];
    }
    if (font != 0) {
        [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(range.location, range.length)];
    }
    self.attributedText = attributedString;
}

+ (CGFloat)calculateLabelSizeWithText:(NSString *)text font:(UIFont *)font lineSpace:(CGFloat)space kern:(CGFloat)kern maxWidth:(CGFloat)width {
    if (!text.length || text == nil) {
        return 0.01f;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(kern) range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGSize size = [attributedString boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:options context:nil].size;
    // 设置行间距，内容全为中文，只显示一行时的计算误差
    if ((size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([[self class] containChinese:text]) {
            size = CGSizeMake(size.width, size.height - paragraphStyle.lineSpacing);
        }
    }
    return size.height;
}

+ (CGFloat)calculateLabelSizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)width {
    if (!text.length || text == nil) {
        return 0.01f;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGSize size = [attributedString boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:options context:nil].size;
    // 设置行间距，内容全为中文，只显示一行时的计算误差
    if ((size.height - font.lineHeight) <= paragraphStyle.lineSpacing) {
        if ([[self class] containChinese:text]) {
            size = CGSizeMake(size.width, size.height - paragraphStyle.lineSpacing);
        }
    }
    return size.height;
}

// 判断内容中是否全部为汉字
+ (BOOL)containChinese:(NSString *)str {
    for(NSInteger i = 0; i < [str length]; i++) {
        int a = [str characterAtIndex:i];
        if(a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

@end
