//
//  NSString+DJValid.h
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DJValid)

//正则匹配电话号码
- (BOOL)isValidPhoneNumber;

//正则匹配邮箱
- (BOOL)isValidEmail;

//正则匹配URL地址
- (BOOL)isValidUrl;

//判断字符串是否只包含字母-1
-(BOOL)containsOnlyLetters;

//判断字符串是否只包含字母-2(正则)
-(BOOL)isLetter;

//判断字符串是否只包含数字-1
-(BOOL)containsOnlyNumbers;

//判断字符串是否只包含数字-2(正则)
-(BOOL)isNumbers;

//判断字符串是否只包含数字和字母
-(BOOL)containsOnlyNumbersAndLetters;

//由字母或数字组成 6-18位密码字符串(正则)
-(BOOL)isPassword;

//判断数组中是否包含某个字符串
-(BOOL)isInThisarray:(NSArray*)array;

//判断字符串是否以某个字符串开头
-(BOOL)isBeginsWith:(NSString *)string;

//判断字符串是否以某个字符串结尾
-(BOOL)isEndssWith:(NSString *)string;

//判断字符串是否包含某个字符串
-(BOOL)containsString:(NSString *)subString;

@end

NS_ASSUME_NONNULL_END
