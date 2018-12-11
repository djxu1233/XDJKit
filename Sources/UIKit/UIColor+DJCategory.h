//
//  UIColor+DJCategory.h
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (DJCategory)

/** 十六进制的颜色(包括0X、#开头)转换为UIColor*/
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/** UIColor转#ffffff格式的字符串*/
+ (NSString *)hexStringFromColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
