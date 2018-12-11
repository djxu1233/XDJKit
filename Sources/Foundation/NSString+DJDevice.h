//
//  NSString+DJDevice.h
//  TransformDemo
//
//  Created by MAC on 2018/11/28.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DJDevice)

/**
 获取机型
 */
+ (NSString *)device_model;

/**
 获取运营商
 */
+ (NSString *)device_operator;

/**
 获取品牌
 */
+ (NSString *)device_brand;

/**
 获取IDFA
 */
+ (NSString *)device_IDFA;

/**
 获取操作系统
 */
+ (NSString *)device_system;



//获取app包名
+(instancetype)dj_appName;
//获取app版本
+(instancetype)dj_appVersion;


@end

NS_ASSUME_NONNULL_END
