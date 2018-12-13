//
//  NSString+DJCategory.h
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DJCategory)

//新字符串替换老字符串
-(NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;

//截取字符串(字符串都是从第0个字符开始数的哦~)
-(NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;

//添加字符串
-(NSString *)addString:(NSString *)string;

//从主字符串中移除某个字符串
-(NSString *)removeSubString:(NSString *)subString;

//去掉字符串中的空格
-(NSString *)removeWhiteSpacesFromString;

//字符串转Data
-(NSData *)convertToData;

//Data转字符转
+(NSString *)getStringFromData:(NSData *)data;

//获取系统版本号
+(NSString *)getMyApplicationVersion;

//字符串编码
-(NSString*)EncodingWithUTF8;

//获取当前时间
+(NSString*)getCurrentTimeString;

//通知字符串长度 (文字 2个字节 字母:1个字节) // 统计ASCII和Unicode混合文本长度
-(NSUInteger)unicodeLengthOfString;

//获取字符串宽
+(CGSize)measureSinglelineStringSize:(NSString*)str andFont:(UIFont*)wordFont;

//获取字符串宽 // 传一个字符串和字体大小来返回一个字符串所占的宽度
+(float)measureSinglelineStringWidth:(NSString*)str andFont:(UIFont*)wordFont;

//获取字符串高 // 传一个字符串和字体大小来返回一个字符串所占的高度
+(float)measureMutilineStringHeight:(NSString*)str
                            andFont:(UIFont*)wordFont
                      andWidthSetup:(float)width;

//计算属性字符文本占用的宽高

/**
 * 计算属性字符文本占用的宽高
 * @param font 显示的字体
 * @param maxSize 最大的显示范围
 * @param lineSpacing 行间距
 * @return 占用的宽高
 */
-(CGSize)attrStrSizeWithFont:(UIFont *)font
                  andmaxSize:(CGSize)maxSize
                 lineSpacing:(CGFloat)lineSpacing;

//时间戳转时间
-(NSDate *)dateValueWithMillisecondsSince1970;

/**
 * @brief 计算Label行数
 *
 * @param string 需要计算的字符串
 * @param font 字符串的字体
 * @param labelWidth 字符串的宽度
 *
 * @return 返回Label的行数
 */
+ (NSArray *)getLinesArrayOfStringInLabel:(NSString *)string
                                     font:(UIFont *)font
                            labelWidth:(CGFloat)labelWidth;




@end

NS_ASSUME_NONNULL_END
