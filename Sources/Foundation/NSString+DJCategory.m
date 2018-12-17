//
//  NSString+DJCategory.m
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "NSString+DJCategory.h"
#import <CoreText/CoreText.h>

@implementation NSString (DJCategory)

//新字符串替换老字符串
-(NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar
{
    return [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}
//截取字符串(字符串都是从第0个字符开始数的哦~)
-(NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end
{
    NSRange r;
    r.location = begin;
    r.length = end - begin;
    return [self substringWithRange:r];
}

//添加字符串
-(NSString *)addString:(NSString *)string
{
    if(!string || string.length == 0)
        return self;
    return [self stringByAppendingString:string];
}
//从主字符串中移除某个字符串
-(NSString *)removeSubString:(NSString *)subString
{
    if ([self containsString:subString])
    {
        NSRange range = [self rangeOfString:subString];
        return [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}
//去掉字符串中的空格
-(NSString *)removeWhiteSpacesFromString
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

//字符串转Data
-(NSData *)convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

//Data转字符转
+(NSString *)getStringFromData:(NSData *)data
{ return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

//获取系统版本号
+(NSString *)getMyApplicationVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *shortVersion = [info objectForKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@", shortVersion];
    // NSString *bundleVersion = [info objectForKey:@"CFBundleVersion"]; 测试字段号
    // NSString *name = [info objectForKey:@"CFBundleDisplayName"]; app 名字
}
//字符串编码
-(NSString*)EncodingWithUTF8
{
    NSString *urlStrl = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return urlStrl;
}
//获取当前时间
+(NSString*)getCurrentTimeString
{
    //获取系统当前时间
    NSDate *currentDate = [NSDate date];
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式:zzz表示时区
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    //输出currentDateString
    return currentDateString;
}
//通知字符串长度 (文字 2个字节 字母:1个字节) // 统计ASCII和Unicode混合文本长度
-(NSUInteger) unicodeLengthOfString {
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < self.length; i++) {
        unichar uc = [self characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    NSUInteger unicodeLength = asciiLength / 2;
    if(asciiLength % 2) {
        unicodeLength++;
    }
    return unicodeLength;
}

+(float)measureMutilineStringHeight:(NSString*)str andFont:(UIFont*)wordFont andWidthSetup:(float)width{
    
    if (str == nil || width <= 0) return 0;
    
    CGSize measureSize = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:wordFont, NSFontAttributeName, nil] context:nil].size;
    
    return ceil(measureSize.height);
}

// 传一个字符串和字体大小来返回一个字符串所占的宽度
+(float)measureSinglelineStringWidth:(NSString*)str andFont:(UIFont*)wordFont{
    
    if (str == nil) return 0;
    
    CGSize measureSize = [str boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:wordFont, NSFontAttributeName, nil] context:nil].size;
    
    return ceil(measureSize.width);
}



+(CGSize)measureSinglelineStringSize:(NSString*)str andFont:(UIFont*)wordFont
{
    
    if (str == nil) return CGSizeZero;
    
    CGSize measureSize = [str boundingRectWithSize:CGSizeMake(0, 0) options:NSStringDrawingUsesFontLeading attributes:[NSDictionary dictionaryWithObjectsAndKeys:wordFont, NSFontAttributeName, nil] context:nil].size;
    
    return measureSize;
}



//计算属性字符文本占用的宽高
/**
 * 计算属性字符文本占用的宽高
 * @param font 显示的字体
 * @param maxSize 最大的显示范围
 * @param lineSpacing 行间距
 * @return 占用的宽高
 */
-(CGSize)attrStrSizeWithFont:(UIFont *)font andmaxSize:(CGSize)maxSize lineSpacing:(CGFloat)lineSpacing{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    NSDictionary *dict = @{NSFontAttributeName: font,
                           NSParagraphStyleAttributeName: paragraphStyle};
    CGSize sizeToFit = [self boundingRectWithSize:maxSize // 用于计算文本绘制时占据的矩形块
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项NSStringDrawingTruncatesLastVisibleLine |
                                       attributes:dict // 文字的属性
                                          context:nil].size; // context上下文。包括一些信息,例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    
    return sizeToFit;
}
//时间戳转时间
-(NSDate *)dateValueWithMillisecondsSince1970 {
    return [NSDate dateWithTimeIntervalSince1970:[self doubleValue] / 1000];
}

//计算Label行数
+ (NSArray *)getLinesArrayOfStringInLabel:(NSString *)string
                                     font:(UIFont *)font
                               labelWidth:(CGFloat)labelWidth
{
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,labelWidth,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [string substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    
    CGPathRelease(path);
    CFRelease( frame );
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}




@end
