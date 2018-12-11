//
//  NSString+DJValid.m
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "NSString+DJValid.h"

@implementation NSString (DJValid)

//正则匹配电话号码
- (BOOL)isValidPhoneNumber
{
    NSString *regex = @"^(13|15|17|18|14)//d{9}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch =[pred evaluateWithObject:self];
    return isMatch;
}
//正则匹配邮箱
-(BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTestPredicate evaluateWithObject:self];
}
//正则匹配URL地址
-(BOOL)isValidUrl
{
    NSString*pattern =@"^[0-9A-Za-z]{1,50}";
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    return [pred evaluateWithObject:self];
}
//判断字符串是否只包含字母-1
-(BOOL)containsOnlyLetters
{
    NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}
//判断字符串是否只包含字母-2(正则)
-(BOOL)isLetter {
    NSString *regEx = @"^[A-Za-z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}
//判断字符串是否只包含数字-1
-(BOOL)containsOnlyNumbers
{
    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}
//判断字符串是否只包含数字-2(正则)
-(BOOL)isNumbers {
    NSString *regEx = @"^-?//d+.?//d?";
    NSPredicate *pred= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [pred evaluateWithObject:self];
}
//判断字符串是否只包含数字和字母
-(BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}
//由字母或数字组成 6-18位密码字符串(正则)
-(BOOL)isPassword {
    NSString * regex = @"^[A-Za-z0-9_]{6,18}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
//判断数组中是否包含某个字符串
-(BOOL)isInThisarray:(NSArray*)array
{
    for(NSString *string in array) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

//判断字符串是否以某个字符串开头
-(BOOL)isBeginsWith:(NSString *)string
{
    return ([self hasPrefix:string]) ? YES : NO;
}
//判断字符串是否以某个字符串结尾
-(BOOL)isEndssWith:(NSString *)string
{
    return ([self hasSuffix:string]) ? YES : NO;
}
//判断字符串是否包含某个字符串
-(BOOL)containsString:(NSString *)subString
{
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}

@end
